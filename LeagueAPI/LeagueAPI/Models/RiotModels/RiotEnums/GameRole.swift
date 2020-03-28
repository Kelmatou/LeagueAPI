//
//  GameRole.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 2/1/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

public class GameRole {
    
    public enum Roles: String {
        case UNSELECTED = "UNSELECTED"
        case FILL = "FILL"
        case TOP = "TOP"
        case JUNGLE = "JUNGLE"
        case MID = "MIDDLE"
        case BOTTOM = "BOTTOM"
        case SUPPORT = "UTILITY"
        case UNKNOWN = "UNKNOWN"
    }

    public private(set) var role: Roles
    
    public init?(_ role: Roles) {
        guard role != .UNKNOWN else {
            Logger.error("Cannot create Game Role object with .UNKNOWN role")
            return nil
        }
        self.role = role
    }
    
    internal init(_ role: String) {
        switch role {
        case Roles.UNSELECTED.rawValue:
            self.role = .UNSELECTED
        case Roles.FILL.rawValue:
            self.role = .FILL
        case Roles.TOP.rawValue:
            self.role = .TOP
        case Roles.JUNGLE.rawValue:
            self.role = .JUNGLE
        case Roles.MID.rawValue:
            self.role = .MID
        case Roles.BOTTOM.rawValue:
            self.role = .BOTTOM
        case Roles.SUPPORT.rawValue:
            self.role = .SUPPORT
        default:
            Logger.warning("Game Role \"\(role)\" unknown (check for LeagueAPI update)")
            self.role = .UNKNOWN
        }
    }
}
