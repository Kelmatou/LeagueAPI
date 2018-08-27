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
    public private(set) var rateLimitManager: RateLimitManager
    
    public init(token: String, rateLimitManager: RateLimitManager? = nil) {
        self.token = token
        self.rateLimitManager = rateLimitManager ?? RateLimitManager()
    }
    
    public func hasReachRateLimit(for method: LeagueMethod) -> Bool {
        return rateLimitManager.hasReachLimit(for: method)
    }
    
    public func durationUntilRateLimitPasses(for method: LeagueMethod) -> Duration {
        return rateLimitManager.durationUntilRateLimitPasses(for: method)
    }
}
