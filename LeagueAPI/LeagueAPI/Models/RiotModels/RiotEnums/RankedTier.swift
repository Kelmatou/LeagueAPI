//
//  RankedTier.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 12/23/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class RankedTier {
    
    public enum Tiers: String {
        case Unranked = "UNRANKED"
        case Iron = "IRON"
        case Bronze = "BRONZE"
        case Silver = "SILVER"
        case Gold = "GOLD"
        case Platinum = "PLATINUM"
        case Diamond = "DIAMOND"
        case Master = "MASTER"
        case GrandMaster = "GRANDMASTER"
        case Challenger = "CHALLENGER"
        case Unknown = "Unknown"
    }
    
    public private(set) var tier: Tiers
    
    public init?(_ tier: Tiers) {
        guard tier != .Unknown else {
            Logger.error("Cannot create Ranked Tier object with .Unknown tier")
            return nil
        }
        self.tier = tier
    }
    
    internal init(_ tier: String) {
        switch tier {
        case Tiers.Unranked.rawValue:
            self.tier = .Unranked
        case Tiers.Iron.rawValue:
            self.tier = .Iron
        case Tiers.Bronze.rawValue:
            self.tier = .Bronze
        case Tiers.Silver.rawValue:
            self.tier = .Silver
        case Tiers.Gold.rawValue:
            self.tier = .Gold
        case Tiers.Platinum.rawValue:
            self.tier = .Platinum
        case Tiers.Diamond.rawValue:
            self.tier = .Diamond
        case Tiers.Master.rawValue:
            self.tier = .Master
        case Tiers.GrandMaster.rawValue:
            self.tier = .GrandMaster
        case Tiers.Challenger.rawValue:
            self.tier = .Challenger
        default:
            Logger.warning("Ranked Tier \"\(tier)\" unknown (check for LeagueAPI update)")
            self.tier = .Unknown
        }
    }
}
