//
//  RiotClientLocation.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 1/9/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

public class RiotClientLocation {
    
    public enum ClientLocation: String, CustomStringConvertible {
        case RiotClient = "riotclient"
        case RiotStatus = "riotstatus"
        case Game = "game"
        case Unknown = "unknown"
        
        public var description: String {
            switch self {
            case .RiotClient:
                return "Riot Client"
            case .RiotStatus:
                return "Riot Status"
            case .Game:
                return "Game"
            case .Unknown:
                return "Unknown"
            }
        }
    }

    public private(set) var location: ClientLocation
    
    public init?(_ location: ClientLocation) {
        guard location != .Unknown else {
            Logger.error("Cannot create Riot Client Location object with .Unknown location")
            return nil
        }
        self.location = location
    }
    
    internal init(_ location: String) {
        switch location {
        case ClientLocation.RiotClient.rawValue:
            self.location = .RiotClient
        case ClientLocation.RiotClient.rawValue:
            self.location = .RiotStatus
        case ClientLocation.Game.rawValue:
            self.location = .Game
        default:
            Logger.warning("Riot Client Location \"\(location)\" unknown (check for LeagueAPI update)")
            self.location = .Unknown
        }
    }
}
