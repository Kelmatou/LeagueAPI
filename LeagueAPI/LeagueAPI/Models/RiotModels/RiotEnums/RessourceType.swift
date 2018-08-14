//
//  RessourceType.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class RessourceType {
    
    public enum RessourceTypes: String {
        case Mana = "MP"
        case Energy = "Energy"
        case BloodWell = "BloodWell"
        case GnarFury = "GnarFury"
        case BattleFury = "BattleFury"
        case Rage = "Rage"
        case Ferocity = "Ferocity"
        case Heat = "Heat"
        case DragonFury = "DragonFury"
        case Wind = "Wind"
        case None = "None"
        case Unknown = "Unknown"
    }
    
    public private(set) var type: RessourceTypes
    
    public init?(_ type: RessourceTypes) {
        guard type != .Unknown else {
            Logger.error("Cannot create RessourceType object with .Unknown type")
            return nil
        }
        self.type = type
    }
    
    internal init(_ type: String) {
        switch type {
        case RessourceTypes.Mana.rawValue:
            self.type = .Mana
        case RessourceTypes.Energy.rawValue:
            self.type = .Energy
        case RessourceTypes.BloodWell.rawValue:
            self.type = .BloodWell
        case RessourceTypes.GnarFury.rawValue:
            self.type = .GnarFury
        case RessourceTypes.BattleFury.rawValue:
            self.type = .BattleFury
        case RessourceTypes.Rage.rawValue:
            self.type = .Rage
        case RessourceTypes.Ferocity.rawValue:
            self.type = .Ferocity
        case RessourceTypes.Heat.rawValue:
            self.type = .Heat
        case RessourceTypes.DragonFury.rawValue:
            self.type = .DragonFury
        case RessourceTypes.Wind.rawValue:
            self.type = .Wind
        case RessourceTypes.None.rawValue:
            self.type = .None
        default:
            Logger.warning("Ressource type \"\(type)\" unknown (check for LeagueAPI update)")
            self.type = .Unknown
        }
    }
}
