//
//  LeagueRequester.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class LeagueRequester {
    
    private static var delayedRequests: [DelayedRequest] = []
    private static var exploringRequests: [ExploringRequest] = []
    
    private enum RequestAuthorization {
        case Accepted(exploring: Bool, identifier: String?)
        case Delayed
        case Refused
    }
    
    private var key: APIKey
    
    public init(key: APIKey) {
        self.key = key
    }
    
    public func request<ResultType: Decodable>(method: LeagueMethod, handler: @escaping (ResultType?, String?) -> Void) {
        let requestAuthorization: RequestAuthorization = canMakeRequest(for: method)
        switch requestAuthorization {
        case .Accepted(let exploring, let identifier):
            self.handleRequestAccepted(exploring: exploring, identifier: identifier, method: method, handler: handler)
        case .Delayed:
            self.handleRequestDelayed(method: method, handler: handler)
        case .Refused:
            handleRequestRefused(method: method, handler: handler)
        }
    }
    
    public static func cancelDelayedRequests() {
        LeagueRequester.delayedRequests.forEach { $0.canceled = true }
        LeagueRequester.delayedRequests.removeAll()
    }
    
    public static func delayedRequestNumber() -> Int {
        return LeagueRequester.delayedRequests.count
    }
    
    private func makeRequest<ResultType: Decodable>(method: LeagueMethod, handler: @escaping (ResultType?, String?) -> Void) {
        self.key.rateLimitManager.countRequestSent(for: method)
        let accessMethod: RESTRequester.AccessMethod = method.getAccessMethod()
        let methodUrl: String = method.getMethodUrl()
        let headers: [String: String] = ["X-Riot-Token": self.key.token]
        let body: Data? = method.getMethodBody()
        
        let completion: (ResultType?, HttpResponseCode, RESTRequester.Headers?, String?) -> Void = { (result, responseCode, headers, error) in
            if responseCode == .NotFound {
                if let warningMessage = method.getWarningMessage() {
                    Logger.warning(warningMessage)
                }
            }
            self.key.rateLimitManager.countRequestReceived(for: method)
            self.key.rateLimitManager.update(for: method, headers: headers)
            if responseCode == .RateLimitExceeded && headers != nil && headers!["Retry-After"] != nil {
                self.handleRateLimitExceeded(headers: headers, method: method, handler: handler)
            }
            else if responseCode == .Forbidden && method is TournamentMethod {
                handler(nil, "Invalid API Key for official Tournament method")
            }
            else {
                handler(result, error)
            }
        }
        let resultIsJson: Bool = !PrimitiveTypeCheck.isPrimitive(ResultType.self)
        let requester: DataRequester = resultIsJson ? JsonRequester() : RawRequester()
        requester.request(accessMethod: accessMethod, methodUrl: methodUrl, headers: headers, body: body, handler: completion)
    }
    
    private func canMakeRequest(for method: LeagueMethod) -> RequestAuthorization {
        let rateLimit: RateLimitManager = self.key.rateLimitManager
        if rateLimit.hasAppRateLimitInformations() {
            if rateLimit.hasReachAppRateLimit() {
                return .Refused
            }
            else if rateLimit.hasMethodLimitInformations(for: method) {
                return rateLimit.hasReachMethodLimit(for: method) ? .Refused : .Accepted(exploring: false, identifier: nil)
            }
            else {
                let signature: String = method.getMethodSignature()
                let acceptRequest: Bool = !rateLimit.methodRateLimitExplorerSent.contains(signature)
                if acceptRequest {
                    rateLimit.methodRateLimitExplorerSent.append(signature)
                }
                return acceptRequest ? .Accepted(exploring: true, identifier: signature) : .Delayed
            }
        }
        else {
            let acceptRequest: Bool = !rateLimit.exploringAppRateLimit
            rateLimit.exploringAppRateLimit = true
            return acceptRequest ? .Accepted(exploring: true, identifier: nil) : .Delayed
        }
    }
    
    private func handleRequestAccepted<ResultType: Decodable>(exploring: Bool, identifier: String?, method: LeagueMethod, handler: @escaping (ResultType?, String?) -> Void) {
        if exploring {
            let exploringRequest: ExploringLeagueRequest<ResultType> = ExploringLeagueRequest(identifier: identifier, handler: { (result, error) in
                let exploringRequestCreated = LeagueRequester.exploringRequests.removeFirst(where: { $0.getidentifier() == identifier })
                self.key.rateLimitManager.exploringAppRateLimit = false
                if let exploringRequestCreated = exploringRequestCreated {
                    exploringRequestCreated.getWaitingRequests().forEach { $0.request() }
                }
                else {
                    Logger.error("Exploring request was not found. Subsequent calls will never be called!")
                }
                handler(result, error)
            })
            LeagueRequester.exploringRequests.append(exploringRequest)
            self.makeRequest(method: method, handler: exploringRequest.handler)
        }
        else {
            self.makeRequest(method: method, handler: handler)
        }
    }
    
    private func handleRequestDelayed<ResultType: Decodable>(method: LeagueMethod, handler: @escaping (ResultType?, String?) -> Void) {
        Logger.debug("Request for \(method.getMethodSignature()) was delayed, waiting to get rate limit informations")
        let identifier: Int = generateRequestIdentifier()
        let delayedRequest: DelayedRequest = DelayedRequest(identifier: identifier, request: {
            LeagueRequester.delayedRequests.removeFirst(where: { $0.identifier ==  identifier })
            self.request(method: method, handler: handler)
        })
        let exploringRequest: ExploringRequest? = LeagueRequester.exploringRequests.first(where: { $0.getidentifier() == nil || $0.getidentifier() == method.getMethodSignature() })
        if let exploringRequest = exploringRequest {
            exploringRequest.addWaitingRequest(delayedRequest)
            LeagueRequester.delayedRequests.append(delayedRequest)
        }
        else {
            Logger.error("Exploring request was not found. Cannot attach request to it. Request will be lost.")
        }
    }
    
    private func handleRequestRefused<ResultType: Decodable>(method: LeagueMethod, handler: @escaping (ResultType?, String?) -> Void) {
        Logger.debug("App Rate Limit reached, delaying request \(method.getMethodSignature())")
        let durationUntilRateLimitPasses: Duration = self.key.durationUntilRateLimitPasses(for: method)
        self.dispatchRequest(in: durationUntilRateLimitPasses, method: method, handler: handler)
    }
    
    private func handleRateLimitExceeded<ResultType: Decodable>(headers: RESTRequester.Headers?, method: LeagueMethod, handler: @escaping (ResultType?, String?) -> Void) {
        if self.key.rateLimitManager.exploringAppRateLimit {
            Logger.warning("App Rate Limit violation! LeagueAPI tried to reach Riot API but first call received App Rate Limit Exception. This may happen and is a normal behavior but if it happens to frequently may result in blacklist of the API key")
        }
        else {
            Logger.error("App Rate Limit violation! Make sure you created only one LeagueAPI object in your application. If this happens frequently, please open an issue at https://github.com/Kelmatou/LeagueAPI/issues")
        }
        if let headers = headers, let retryAfter = headers["Retry-After"] as? Int {
            let durationUntilRateLimitPasses: Duration = Duration(seconds: Double(retryAfter))
            Logger.error("Request is not lost and will be re-executed in \(durationUntilRateLimitPasses.seconds)s")
            self.dispatchRequest(in: durationUntilRateLimitPasses, method: method, handler: handler)
        }
        else {
            Logger.error("Request is not lost and will be delayed")
            self.handleRequestRefused(method: method, handler: handler)
        }
    }
    
    private func dispatchRequest<ResultType: Decodable>(in duration: Duration, method: LeagueMethod, handler: @escaping (ResultType?, String?) -> Void) {
        Logger.debug("Retrying request in \(duration.durationSeconds)s")
        let identifier: Int = generateRequestIdentifier()
        let delayedRequest: DurationDelayedRequest = DurationDelayedRequest(identifier: identifier, delay: duration, request: {
            LeagueRequester.delayedRequests.removeFirst(where: { $0.identifier ==  identifier })
            self.request(method: method, handler: handler)
        })
        LeagueRequester.delayedRequests.append(delayedRequest)
        delayedRequest.start()
    }
    
    private func generateRequestIdentifier() -> Int {
        var random: Int = Int.random(in: 0 ..< Int.max)
        while LeagueRequester.delayedRequests.contains(where: { $0.identifier == random }) {
            random = Int.random(in: 0 ..< Int.max)
        }
        return random
    }
}
