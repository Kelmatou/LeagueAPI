//
//  RateLimit.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class RateLimit {
    
    public var current: Int
    public var limit: Int
    
    public var hasReachLimit: Bool {
        return self.current >= self.limit
    }
    
    public init?(currentAndLimit: String) {
        let values: [Substring] = currentAndLimit.split(separator: ":")
        guard values.count == 2,
              let currentValue = Int(values[0]),
              let limitValue = Int(values[1]) else { return nil }
        self.current = currentValue
        self.limit = limitValue
    }
}
