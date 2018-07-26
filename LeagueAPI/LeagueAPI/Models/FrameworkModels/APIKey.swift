//
//  APIKey.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class APIKey {
    
    public var token: String
    public var appRateLimit: RateLimit?
    public var methodLimits: Dictionary<String, RateLimit>
    
    public init(token: String, appRateLimit: RateLimit? = nil, methodLimits: Dictionary<String, RateLimit>? = nil) {
        self.token = token
        self.appRateLimit = appRateLimit
        self.methodLimits = methodLimits ?? Dictionary()
    }
    
    public func hasReachAppRateLimit() -> Bool {
        return appRateLimit?.hasReachLimit ?? false
    }
    
    public func hasReachMethodLimit(for method: String) -> Bool {
        return self.methodLimits[method]?.hasReachLimit ?? false
    }
}
