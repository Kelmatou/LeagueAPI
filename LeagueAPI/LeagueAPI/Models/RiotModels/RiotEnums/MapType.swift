//
//  MapType.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/13/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class MapType {
    
    public enum Types: String {
        case SummonersRift = "SUMMONERS_RIFT"
        case TwistedTreeline = "TWISTED_TREELINE"
        case HowlingAbyss = "HOWLING_ABYSS"
        case Unknown = "Unknown"
    }
    
    public private(set) var type: Types
    
    public init?(_ type: Types) {
        guard type != .Unknown else {
            Logger.error("Cannot create MapType object with .Unknown type")
            return nil
        }
        self.type = type
    }
    
    internal init(_ type: String) {
        switch type {
        case Types.SummonersRift.rawValue:
            self.type = .SummonersRift
        case Types.TwistedTreeline.rawValue:
            self.type = .TwistedTreeline
        case Types.HowlingAbyss.rawValue:
            self.type = .HowlingAbyss
        default:
            Logger.warning("Map type \"\(type)\" unknown (check for LeagueAPI update)")
            self.type = .Unknown
        }
    }
}
