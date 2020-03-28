//
//  TeamRole.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 3/28/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public class TeamRole {
    
    public enum Roles: String {
        case CAPTAIN = "CAPTAIN"
        case MEMBER = "MEMBER"
        case UNKNOWN = "UNKNOWN"
    }

    public private(set) var role: Roles
    
    public init?(_ role: Roles) {
        guard role != .UNKNOWN else {
            Logger.error("Cannot create Team Role object with .UNKNOWN role")
            return nil
        }
        self.role = role
    }
    
    internal init(_ role: String) {
        switch role {
        case Roles.CAPTAIN.rawValue:
            self.role = .CAPTAIN
        case Roles.MEMBER.rawValue:
            self.role = .MEMBER
        default:
            Logger.warning("Team Role \"\(role)\" unknown (check for LeagueAPI update)")
            self.role = .UNKNOWN
        }
    }
}
