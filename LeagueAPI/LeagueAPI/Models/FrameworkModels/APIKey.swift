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
                Logger.debug("Has reach App Rate Limit")
                return true
            }
        }
        return false
    }
    
    public func hasReachMethodLimit(for method: String) -> Bool {
        guard let methodLimits = self.methodLimits[method] else { return false }
        for rateLimit in methodLimits {
            if rateLimit.hasReachLimit {
                Logger.debug("Has reach Method Rate Limit for \(method)")
                return true
            }
        }
        return false
    }
    
    public func updateAppRateLimit(with newLimits: String, appRate: String) {
        let newRateLimits: [RateLimit] = RateLimit.array(from: newLimits, and: appRate)
        self.appRateLimit.merge(with: newRateLimits)
        Logger.debug("New app rate limits:")
        for limit in self.appRateLimit {
            Logger.debug(limit.status())
        }
    }
    
    public func updateMethodLimit(for method: String, newLimits: String, methodRate: String) {
        let newRateLimits: [RateLimit] = RateLimit.array(from: newLimits, and: methodRate)
        if self.methodLimits[method] != nil {
            self.methodLimits[method]?.merge(with: newRateLimits)
        }
        else {
            newRateLimits.forEach { $0.adjustRecords() }
            self.methodLimits[method] = newRateLimits
        }
        Logger.debug("New method rate limits for \(method):")
        guard let methodLimits = self.methodLimits[method] else { return }
        for limit in methodLimits {
            Logger.debug(limit.status())
        }
    }
    
    public func notifyNewRequest(for method: String) {
        self.appRateLimit.forEach { $0.countNewRequest() }
        if let methodRateLimits = self.methodLimits[method] {
            methodRateLimits.forEach { $0.countNewRequest() }
        }
    }
}
