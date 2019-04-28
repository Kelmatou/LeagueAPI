//
//  IntExtension.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/17/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal extension Int {
    
    /**
     Indicates if an Int is in range [min, max]
     
     - parameter min: lowest Int value in valid range. If nil -> -infinite
     - parameter max: greatest Int value in valid range. If nil -> +infinite
     
     - returns: true if value is in range [min, max]
     */
    func isBetween(min: Int?, max: Int?) -> Bool {
        if let min = min {
            if let max = max  {
                return self >= min && self <= max
            }
            else {
                return self >= min
            }
        }
        else if let max = max {
            return self <= max
        }
        return true
    }
}
