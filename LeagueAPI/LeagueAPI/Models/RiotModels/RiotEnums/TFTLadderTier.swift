//
//  TFTLadderTier.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 5/30/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

public class TFTLadderTier {
    
    public enum Tiers: String, CustomStringConvertible {
        case Orange = "ORANGE"
        case Purple = "PURPLE"
        case Blue = "BLUE"
        case Green = "GREEN"
        case Gray = "GRAY"
        case Unknown = "Unknown"
        
        public var description: String {
            return self.rawValue
        }
    }
    
    public private(set) var tier: Tiers
    
    public init?(_ tier: Tiers) {
        guard tier != .Unknown else {
            Logger.error("Cannot create TFTLadderTier object with .Unknown tier")
            return nil
        }
        self.tier = tier
    }
    
    internal init(_ tier: String) {
        switch tier {
        case Tiers.Orange.rawValue:
            self.tier = .Orange
        case Tiers.Purple.rawValue:
            self.tier = .Purple
        case Tiers.Blue.rawValue:
            self.tier = .Blue
        case Tiers.Green.rawValue:
            self.tier = .Green
        case Tiers.Gray.rawValue:
            self.tier = .Gray
        default:
            Logger.warning("TFT Tier \"\(tier)\" unknown (check for LeagueAPI update)")
            self.tier = .Unknown
        }
    }
}
