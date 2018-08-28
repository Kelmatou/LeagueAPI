//
//  PickType.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/13/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class PickType {
    
    public enum Types: String {
        case Blind = "BLIND_PICK"
        case Draft = "DRAFT_MODE"
        case AllRandom = "ALL_RANDOM"
        case TournamentDraft = "TOURNAMENT_DRAFT"
        case Unknown = "Unknown"
    }
    
    public private(set) var type: Types
    
    public init?(_ type: Types) {
        guard type != .Unknown else {
            Logger.error("Cannot create PickType object with .Unknown type")
            return nil
        }
        self.type = type
    }
    
    internal init(_ type: String) {
        switch type {
        case Types.Blind.rawValue:
            self.type = .Blind
        case Types.Draft.rawValue:
            self.type = .Draft
        case Types.AllRandom.rawValue:
            self.type = .AllRandom
        case Types.TournamentDraft.rawValue:
            self.type = .TournamentDraft
        default:
            Logger.warning("Pick type \"\(type)\" unknown (check for LeagueAPI update)")
            self.type = .Unknown
        }
    }
}
