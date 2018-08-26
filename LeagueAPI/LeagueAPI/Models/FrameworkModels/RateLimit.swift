//
//  RateLimit.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class RateLimit {
    
    public private(set) var current: Int
    public private(set) var limit: Int
    public private(set) var duration: Int
    public private(set) var creations: [Date]
    public private(set) var currentRequestNb: Int
    
    public var hasReachLimit: Bool {
        Logger.debug("Knowing current rate limit is \(self.current), with \(self.currentRequestNb) request sent, there are \(self.limit - self.current - self.currentRequestNb) requests available.")
        if self.current + self.currentRequestNb < self.limit { return false }
        clean()
        Logger.debug("After clean, current rate limit is \(self.current), which is \(self.creations.count + self.currentRequestNb >= self.limit ? "not enough " : "") to accept new request sending")
        return self.creations.count + self.currentRequestNb >= self.limit
    }
    
    public init(current: Int, limit: Int, duration: Int) {
        self.current = current
        self.limit = limit
        self.duration = duration
        self.creations = Array<Date>(repeating: Date(), count: current)
        self.currentRequestNb = 0
    }
    
    public func countRequestSent() {
        self.currentRequestNb += 1
    }
    
    public func countRequestReceived() {
        if self.currentRequestNb > 0 {
            self.currentRequestNb -= 1
        }
    }
    
    // It is considered to be merged with a new RateLimit.
    // New RateLimit have 'current' times the same creation date
    public func merge(with newRateLimit: RateLimit) {
        self.current = newRateLimit.current
        self.creations.keepLast(n: self.current - 1)
        self.clean()
        if self.current > 0 {
            let newDate: Date = newRateLimit.creations[0] // Not check but we want a crash if predicate
                                                    // "have 'current' times the same date" is not respected
            self.creations.fill(with: newDate, untilCount: self.current)
        }
        self.currentRequestNb += newRateLimit.currentRequestNb
    }
    
    public func status() -> String {
        return "\(current)/\(limit) - \(duration)s (has \(creations.count) records and \(currentRequestNb) current requests)"
    }
    
    private func clean() {
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
                    rateLimit.merge(with: newRateLimit)
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
    
    internal func hasReachRateLimit() -> Bool {
        for rateLimit in self {
            if rateLimit.hasReachLimit {
                return true
            }
        }
        return false
    }
}
