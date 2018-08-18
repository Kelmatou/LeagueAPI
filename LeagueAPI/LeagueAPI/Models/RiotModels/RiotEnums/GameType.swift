//
//  GameType.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/18/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class GameType {
    
    public enum Types: String {
        case Custom = "CUSTOM_GAME"
        case MatchMaking = "MATCHED_GAME"
        case Tutorial = "TUTORIAL_GAME"
        case Unknown = "Unknown"
    }
    
    public private(set) var type: Types
    
    public init?(_ type: Types) {
        guard type != .Unknown else {
            Logger.error("Cannot create GameType object with .Unknown type")
            return nil
        }
        self.type = type
    }
    
    internal init(_ type: String) {
        switch type {
        case Types.Custom.rawValue:
            self.type = .Custom
        case Types.MatchMaking.rawValue:
            self.type = .MatchMaking
        case Types.Tutorial.rawValue:
            self.type = .Tutorial
        default:
            Logger.warning("Game type \"\(type)\" unknown (check for LeagueAPI update)")
            self.type = .Unknown
        }
    }
}
