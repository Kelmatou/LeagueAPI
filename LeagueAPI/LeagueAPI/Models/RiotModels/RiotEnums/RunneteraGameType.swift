//
//  RunneteraGameType.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 1/15/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

public class RunneteraGameType {
    
    public enum GameType: String, CustomStringConvertible {
        case Ranked = "Ranked"
        case Normal = "Normal"
        case AI = "AI"
        case Tutorial = "Tutorial"
        case VanillaTrial = "VanillaTrial"
        case Singleton = "Singleton"
        case StandardGauntlet = "StandardGauntlet"
        case Unknown = "unknown"
        
        public var description: String {
            switch self {
            case .Ranked:
                return "Ranked"
            case .Normal:
                return "Normal"
            case .AI:
                return "AI"
            case .Tutorial:
                return "Tutorial"
            case .VanillaTrial:
                return "Vanilla Trial"
            case .Singleton:
                return "Singleton"
            case .StandardGauntlet:
                return "Standard Gauntlet"
            case .Unknown:
                return "Unknown"
            }
        }
    }

    public private(set) var gameType: GameType
    
    public init?(_ gameType: GameType) {
        guard gameType != .Unknown else {
            Logger.error("Cannot create Runnetera Game Type object with .Unknown game type")
            return nil
        }
        self.gameType = gameType
    }
    
    internal init(_ gameType: String) {
        switch gameType {
        case GameType.Ranked.rawValue:
            self.gameType = .Ranked
        case GameType.Normal.rawValue:
            self.gameType = .Normal
        case GameType.AI.rawValue:
            self.gameType = .AI
        case GameType.Tutorial.rawValue:
            self.gameType = .Tutorial
        case GameType.VanillaTrial.rawValue:
            self.gameType = .VanillaTrial
        case GameType.Singleton.rawValue:
            self.gameType = .Singleton
        case GameType.StandardGauntlet.rawValue:
            self.gameType = .StandardGauntlet
        default:
            Logger.warning("Runnetera Game Type \"\(gameType)\" unknown (check for LeagueAPI update)")
            self.gameType = .Unknown
        }
    }
}
