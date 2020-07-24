//
//  RiotGames.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/20/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public enum RiotGames: String {
    case LEAGUE_OF_LEGENDS = "lol"
    case TFT = "tft"
    case LEGENDS_OF_RUNNETERRA = "lor"
    case VALORANT = "val"
}

public class ShardGame {
    
    public enum ShardGames: String {
        case LEGENDS_OF_RUNNETERRA = "lor"
        case VALORANT = "val"
        case UNKNOWN = "unknown"
    }

    public private(set) var shardGame: ShardGames
    
    public init?(_ shardGame: ShardGames) {
        guard shardGame != .UNKNOWN else {
            Logger.error("Cannot create Shard Game object with .UNKNOWN shard game")
            return nil
        }
        self.shardGame = shardGame
    }
    
    internal init(_ shardGame: String) {
        switch shardGame {
        case ShardGames.LEGENDS_OF_RUNNETERRA.rawValue:
            self.shardGame = .LEGENDS_OF_RUNNETERRA
        case ShardGames.VALORANT.rawValue:
            self.shardGame = .VALORANT
        default:
            Logger.warning("Shard Game \"\(shardGame)\" unknown (check for LeagueAPI update)")
            self.shardGame = .UNKNOWN
        }
    }
}
