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
    public var duration: Int
    public var creations: [Date]
    
    public var hasReachLimit: Bool {
        if self.current < self.limit { return false }
        clean()
        return self.creations.count >= self.limit
    }
    
    public init(current: Int, limit: Int, duration: Int) {
        self.current = current
        self.limit = limit
        self.duration = duration
        self.creations = [Date()]
    }
    
    public func clean() {
        self.creations = self.creations.filter { date in
            return -date.timeIntervalSinceNow < Double(duration) }
    }
    
    public static func array(from currentAndDurationList: String, and limitAndDurationList: String) -> [RateLimit] {
        let currentsAndDurations: [Substring] = currentAndDurationList.split(separator: ",")
        let limitsAndDurations: [Substring] = limitAndDurationList.split(separator: ",")
        let currentAndDurationValues: [Rate] = Rate.array(from: currentsAndDurations)
        let limitAndDurationValues: [Rate] = Rate.array(from: limitsAndDurations)
        var rateLimits: [RateLimit] = []
        for currentAndDurationValue in currentAndDurationValues {
            for limitAndDurationValue in limitAndDurationValues {
                if currentAndDurationValue.duration == limitAndDurationValue.duration {
                    rateLimits.append(RateLimit(current: currentAndDurationValue.value, limit: limitAndDurationValue.value, duration: currentAndDurationValue.duration))
                    break
                }
            }
        }
        return rateLimits
    }
}

extension Array where Element:RateLimit {
    
    internal mutating func merge(with newArray: [RateLimit]) {
        var result: [RateLimit] = self
        for newRateLimit in newArray {
            var found: Bool = false
            for rateLimit in result {
                if rateLimit.duration == newRateLimit.duration {
                    rateLimit.current = newRateLimit.current
                    rateLimit.creations.append(newRateLimit.creations[0])
                    rateLimit.clean()
                    found = true
                    break
                }
            }
            if !found {
                result.append(newRateLimit)
            }
        }
        self = result as! Array<Element>
    }
}
