//
//  PickType.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/13/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class PickType {
    
    public enum Types: String, CustomStringConvertible {
        case Blind = "BLIND_PICK"
        case Draft = "DRAFT_MODE"
        case AllRandom = "ALL_RANDOM"
        case TournamentDraft = "TOURNAMENT_DRAFT"
        case Unknown = "Unknown"
        
        public var description: String {
            switch self {
            case .Blind:
                return "Blind"
            case .Draft:
                return "Draft"
            case .AllRandom:
                return "All Random"
            case .TournamentDraft:
                return "Tournament Draft"
            case .Unknown:
                return "Unknown"
            }
        }
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
