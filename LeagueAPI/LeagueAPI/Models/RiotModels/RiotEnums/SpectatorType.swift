//
//  SpectatorType.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/13/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class SpectatorType {
    
    public enum Types: String {
        case None = "NONE"
        case LobbyOnly = "LOBBYONLY"
        case All = "ALL"
        case Unknown = "Unknown"
    }
    
    public private(set) var type: Types
    
    public init?(_ type: Types) {
        guard type != .Unknown else {
            Logger.error("Cannot create SpectatorType object with .Unknown type")
            return nil
        }
        self.type = type
    }
    
    internal init(_ type: String) {
        switch type {
        case Types.None.rawValue:
            self.type = .None
        case Types.LobbyOnly.rawValue:
            self.type = .LobbyOnly
        case Types.All.rawValue:
            self.type = .All
        default:
            Logger.warning("Spectator type \"\(type)\" unknown (check for LeagueAPI update)")
            self.type = .Unknown
        }
    }
}
