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
        case Mana = "Mana"
        case Energy = "Energy"
        case BloodWell = "Blood Well"
        case Courage = "Courage"
        case Shield = "Shield"
        case Fury = "Fury"
        case Rage = "Rage"
        case Ferocity = "Ferocity"
        case Heat = "Heat"
        case CrimsonRush = "Crimson Rush"
        case Flow = "Flow"
        case Grit = "Grit"
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
        case RessourceTypes.Courage.rawValue:
            self.type = .Courage
        case RessourceTypes.Shield.rawValue:
            self.type = .Shield
        case RessourceTypes.Fury.rawValue:
            self.type = .Fury
        case RessourceTypes.Rage.rawValue:
            self.type = .Rage
        case RessourceTypes.Ferocity.rawValue:
            self.type = .Ferocity
        case RessourceTypes.Heat.rawValue:
            self.type = .Heat
        case RessourceTypes.CrimsonRush.rawValue:
            self.type = .CrimsonRush
        case RessourceTypes.Flow.rawValue:
            self.type = .Flow
        case RessourceTypes.Grit.rawValue:
            self.type = .Grit
        case RessourceTypes.None.rawValue:
            self.type = .None
        default:
            Logger.warning("Ressource type \"\(type)\" unknown (check for LeagueAPI update)")
            self.type = .Unknown
        }
    }
}
