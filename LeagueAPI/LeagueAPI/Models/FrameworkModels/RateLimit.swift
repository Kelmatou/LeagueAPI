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
        if self.current + self.currentRequestNb < self.limit { return false }
        clean()
        return self.creations.count + self.currentRequestNb >= self.limit
    }
    
    public init(current: Int, limit: Int, duration: Int) {
        self.current = current
        self.limit = limit
        self.duration = duration
        self.creations = [Date()]
        self.currentRequestNb = 0
    }
    
    public func countNewRequest() {
        self.currentRequestNb += 1
    }
    
    public func countRequestReceived() {
        if self.currentRequestNb > 0 {
            self.currentRequestNb -= 1
        }
    }
    
    public func merge(with newRateLimit: RateLimit) {
        self.current = newRateLimit.current
        self.creations.append(newRateLimit.creations[0])
        self.currentRequestNb += newRateLimit.currentRequestNb
        self.clean()
    }
    
    public func status() -> String {
        return "\(current)/\(limit) - \(duration)s (has \(creations.count) records and \(currentRequestNb) current requests"
    }
    
    private func clean() {
        self.creations = self.creations.filter { date in
            return -date.timeIntervalSinceNow < Double(duration) }
    }
    
    internal func adjustRecords() {
        while creations.count < current {
            creations.insert(creations.first ?? Date(), at: 0)
        }
        while creations.count > current {
            creations.remove(at: 0)
        }
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
                    rateLimit.countRequestReceived()
                    found = true
                    break
                }
            }
            if !found {
                newRateLimit.adjustRecords()
                result.append(newRateLimit)
            }
        }
        self = result as! Array<Element>
    }
}
