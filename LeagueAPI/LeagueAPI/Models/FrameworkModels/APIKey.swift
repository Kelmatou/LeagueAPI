//
//  APIKey.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class APIKey {
    
    public private(set) var token: String
    public private(set) var appRateLimit: [RateLimit]
    public private(set) var methodLimits: Dictionary<String, [RateLimit]>
    
    public init(token: String, appRateLimit: [RateLimit] = [], methodLimits: Dictionary<String, [RateLimit]>? = nil) {
        self.token = token
        self.appRateLimit = appRateLimit
        self.methodLimits = methodLimits ?? Dictionary()
    }
    
    public func hasReachLimit(for method: String) -> Bool {
        return hasReachAppRateLimit() || hasReachMethodLimit(for: method)
    }
    
    public func hasReachAppRateLimit() -> Bool {
        for rateLimit in self.appRateLimit {
            if rateLimit.hasReachLimit {
                return true
            }
        }
        return false
    }
    
    public func hasReachMethodLimit(for method: String) -> Bool {
        guard let methodLimits = self.methodLimits[method] else { return false }
        for rateLimit in methodLimits {
            if rateLimit.hasReachLimit {
                return true
            }
        }
        return false
    }
    
    public func updateAppRateLimit(with newLimits: String, appRate: String) {
        let newRateLimits: [RateLimit] = RateLimit.array(from: newLimits, and: appRate)
        self.appRateLimit.merge(with: newRateLimits)
        Logger.print("New app rate limits:")
        for limit in self.appRateLimit {
            Logger.print("\(limit.current)/\(limit.limit) - \(limit.duration)s (has \(limit.creations.count) records)")
        }
    }
    
    public func updateMethodLimit(for method: String, newLimits: String, methodRate: String) {
        let newRateLimits: [RateLimit] = RateLimit.array(from: newLimits, and: methodRate)
        if self.methodLimits[method] != nil {
            self.methodLimits[method]?.merge(with: newRateLimits)
        }
        else {
            self.methodLimits[method] = newRateLimits
        }
        Logger.print("New method rate limits for \(method):")
        guard let methodLimits = self.methodLimits[method] else { return }
        for limit in methodLimits {
            Logger.print("\(limit.current)/\(limit.limit) - \(limit.duration)s (has \(limit.creations.count) records)")
        }
    }
}
