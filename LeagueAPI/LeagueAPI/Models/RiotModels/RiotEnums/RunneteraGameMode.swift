//
//  RunneteraGameMode.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 1/15/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

public class RunneteraGameMode {
    
    public enum GameMode: String, CustomStringConvertible {
        case Constructed = "Constructed"
        case Expeditions = "Expeditions"
        case Tutorial = "Tutorial"
        case Unknown = "unknown"
        
        public var description: String {
            return self.rawValue
        }
    }

    public private(set) var gameMode: GameMode
    
    public init?(_ gameMode: GameMode) {
        guard gameMode != .Unknown else {
            Logger.error("Cannot create Runnetera Game Mode object with .Unknown game mode")
            return nil
        }
        self.gameMode = gameMode
    }
    
    internal init(_ gameMode: String) {
        switch gameMode {
        case GameMode.Constructed.rawValue:
            self.gameMode = .Constructed
        case GameMode.Expeditions.rawValue:
            self.gameMode = .Expeditions
        case GameMode.Tutorial.rawValue:
            self.gameMode = .Tutorial
        default:
            Logger.warning("Runnetera Game Mode \"\(gameMode)\" unknown (check for LeagueAPI update)")
            self.gameMode = .Unknown
        }
    }
}
