//
//  RankedDivision.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 2/1/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

public class RankedDivision {
    
    public private(set) var tier: RankedTier
    public private(set) var division: Int
    public var divisionRoman: String {
        switch self.division {
        case 1: return "I"
        case 2: return "II"
        case 3: return "III"
        case 4: return "IV"
        case 5: return "V"
        default: return ""
        }
    }
    
    public init(tier: RankedTier, division: Int) {
        self.tier = tier
        self.division = division
    }
    
    public convenience init(tier: RankedTier, divisionRoman: String) {
        var division: Int {
            switch divisionRoman {
            case "I": return 1
            case "II": return 2
            case "III": return 3
            case "IV": return 4
            case "V": return 5
            default: return 0
            }
        }
        self.init(tier: tier, division: division)
    }
}
