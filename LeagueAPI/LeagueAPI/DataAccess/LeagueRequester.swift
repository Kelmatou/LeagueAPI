//
//  LeagueRequester.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class LeagueRequester {
    
    private var key: APIKey
    
    public init(key: APIKey) {
        self.key = key
    }
    
    internal func request<ResultType: Decodable>(method: LeagueMethod, handler: @escaping (ResultType?, String?) -> Void) {
        if canMakeRequest(for: method) {
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
                handler(result, error)
            }
            let resultIsJson: Bool = !PrimitiveTypeCheck.isPrimitive(ResultType.self)
            let requester: DataRequester = resultIsJson ? JsonRequester() : RawRequester()
            requester.request(accessMethod: accessMethod, methodUrl: methodUrl, headers: headers, body: body, handler: completion)
        }
        else {
            handler(nil, "Cannot make request for now (Rate limit reached)")
        }
    }
    
    private func canMakeRequest(for method: LeagueMethod) -> Bool {
        return !self.key.hasReachRateLimit(for: method)
    }
}
