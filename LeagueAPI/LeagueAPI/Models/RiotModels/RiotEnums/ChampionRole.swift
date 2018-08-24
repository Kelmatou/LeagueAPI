//
//  ChampionRole.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/23/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class ChampionRole: Equatable {
    
    public enum Role: String {
        case Assassin = "Assassin"
        case Fighter = "Fighter"
        case Mage = "Mage"
        case Marksman = "Marksman"
        case Support = "Support"
        case Tank = "Tank"
        case Unknown = "Unknown"
    }
    
    public private(set) var role: Role
    
    public init?(_ role: Role) {
        guard role != .Unknown else {
            Logger.error("Cannot create ChampionRole object with .Unknown role")
            return nil
        }
        self.role = role
    }
    
    internal init(_ role: String) {
        switch role {
        case Role.Assassin.rawValue:
            self.role = .Assassin
        case Role.Fighter.rawValue:
            self.role = .Fighter
        case Role.Mage.rawValue:
            self.role = .Mage
        case Role.Marksman.rawValue:
            self.role = .Marksman
        case Role.Support.rawValue:
            self.role = .Support
        case Role.Tank.rawValue:
            self.role = .Tank
        default:
            Logger.warning("Champion role \"\(role)\" unknown (check for LeagueAPI update)")
            self.role = .Unknown
        }
    }
    
    public static func ==(lhs: ChampionRole, rhs: ChampionRole) -> Bool {
        return lhs.role == rhs.role
    }
}
