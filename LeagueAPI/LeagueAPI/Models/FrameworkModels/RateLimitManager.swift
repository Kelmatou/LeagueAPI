//
//  RateLimitManager.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class RateLimitManager {
    
    public private(set) var appRateLimit: [RateLimit]
    public private(set) var methodLimits: Dictionary<String, [RateLimit]>
    public var exploringAppRateLimit: Bool // When set to true, request is in progress to know AppRateLimit
    public var methodRateLimitExplorerSent: [String] // Methods in array have a request to know limit
    
    public init(appRateLimit: [RateLimit] = [], methodLimits: [String: [RateLimit]]? = nil) {
        self.appRateLimit = appRateLimit
        self.methodLimits = methodLimits ?? Dictionary()
        self.exploringAppRateLimit = false
        self.methodRateLimitExplorerSent = []
    }
    
    public func hasAppRateLimitInformations() -> Bool {
        return !self.appRateLimit.isEmpty
    }
    
    public func hasMethodLimitInformations(for method: LeagueMethod) -> Bool {
        return self.methodLimits[method.getMethodSignature()] != nil
    }
    
    public func hasReachLimit(for method: LeagueMethod) -> Bool {
        return hasReachAppRateLimit() || hasReachMethodLimit(for: method)
    }
    
    public func hasReachAppRateLimit() -> Bool {
        if self.appRateLimit.hasReachRateLimit() {
            Logger.debug("App Rate Limit reached")
            return true
        }
        return false
    }
    
    public func hasReachMethodLimit(for method: LeagueMethod) -> Bool {
        guard let methodLimits = self.methodLimits[method.getMethodSignature()] else { return false }
        if methodLimits.hasReachRateLimit() {
            Logger.debug("Rate Limit reached for method: \(method.getMethodSignature())")
            return true
        }
        return false
    }
    
    public func durationUntilRateLimitPasses(for method: LeagueMethod) -> Duration {
        return max(self.durationUntilAppRateLimitPasses(), self.durationUntilMethodLimitPasses(for: method))
    }
    
    public func durationUntilAppRateLimitPasses() -> Duration {
        return self.appRateLimit.maximumDurationUntilRateLimitPasses()
    }
    
    public func durationUntilMethodLimitPasses(for method: LeagueMethod) -> Duration {
        return self.methodLimits[method.getMethodSignature()]?.maximumDurationUntilRateLimitPasses() ?? Duration(seconds: 0)
    }
    
    public func countRequestSent(for method: LeagueMethod) {
        self.countRequestForAppRateLimit(sent: true)
        self.countRequestForMethodLimit(method: method.getMethodSignature(), sent: true)
    }
    
    public func countRequestReceived(for method: LeagueMethod) {
        self.countRequestForAppRateLimit(sent: false)
        self.countRequestForMethodLimit(method: method.getMethodSignature(), sent: false)
    }
    
    private func countRequestForAppRateLimit(sent: Bool) {
        self.appRateLimit.forEach { sent ? $0.countRequestSent() : $0.countRequestReceived() }
    }
    
    private func countRequestForMethodLimit(method: String, sent: Bool) {
        if let methodRateLimits = self.methodLimits[method] {
            methodRateLimits.forEach { sent ? $0.countRequestSent() : $0.countRequestReceived() }
        }
    }
    
    public func update(for method: LeagueMethod, headers: RESTRequester.Headers?) {
        guard let headers = headers else { return }
        if let appRateLimitCount = headers["X-App-Rate-Limit-Count"] as? String,
           let appRateLimit = headers["X-App-Rate-Limit"] as? String {
            self.updateAppRateLimit(limitCount: appRateLimit, currentCount: appRateLimitCount)
        }
        if let methodLimitCount = headers["X-Method-Rate-Limit-Count"] as? String,
           let methodLimit = headers["X-Method-Rate-Limit"] as? String {
            self.updateMethodRateLimit(method: method.getMethodSignature(), limitCount: methodLimit, currentCount: methodLimitCount)
        }
    }
    
    private func updateAppRateLimit(limitCount: String, currentCount: String) {
        let newRateLimits: [RateLimit] = RateLimit.array(from: currentCount, and: limitCount)
        self.appRateLimit.merge(with: newRateLimits)
        Logger.debug("New app rate limits:")
        for limit in self.appRateLimit {
            Logger.debug(limit.status())
        }
    }
    
    private func updateMethodRateLimit(method: String, limitCount: String, currentCount: String) {
        let newRateLimits: [RateLimit] = RateLimit.array(from: currentCount, and: limitCount)
        if var methodRateLimit = self.methodLimits[method] {
            methodRateLimit.merge(with: newRateLimits)
        }
        else {
            self.methodLimits[method] = newRateLimits
        }
        Logger.debug("New method rate limits for \(method):")
        guard let methodLimits = self.methodLimits[method] else { return }
        for limit in methodLimits {
            Logger.debug(limit.status())
        }
    }
}
