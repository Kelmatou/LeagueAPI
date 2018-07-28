//
//  Rate.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/27/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class Rate {
    
    public private(set) var value: Int
    public private(set) var duration: Int
    
    public init?(from valueAndDuration: String) {
        let values: [Substring] = valueAndDuration.split(separator: ":")
        guard values.count == 2, let value = Int(values[0]), let duration = Int(values[1]) else { return nil }
        self.value = value
        self.duration = duration
    }
    
    public static func array(from strings: [Substring]) -> [Rate] {
        var rates: [Rate] = []
        for string in strings {
            if let newRate = Rate(from: String(string)) {
                rates.append(newRate)
            }
        }
        return rates
    }
}
