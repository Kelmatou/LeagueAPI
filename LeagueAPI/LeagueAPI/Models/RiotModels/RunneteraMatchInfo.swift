//
//  RunneteraMatchInfo.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 1/15/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

public class RunneteraMatchInfo: Decodable {
    
    public var gameMode: RunneteraGameMode
    public var gameType: RunneteraGameType
    public var gameStartTimeUtc: String
    public var gameVersion: String
    public var players: [RunneteraMatchPlayer]
    public var totalTurnCount: Int
    
    enum CodingKeys: String, CodingKey {
        case gameMode = "game_mode"
        case gameType = "game_type"
        case gameStartTimeUtc = "game_start_time_utc"
        case gameVersion = "game_version"
        case players = "players"
        case totalTurnCount = "total_turn_count"
    }
    
    public init(gameMode: RunneteraGameMode, gameType: RunneteraGameType, gameStartTimeUtc: String, gameVersion: String, players: [RunneteraMatchPlayer], totalTurnCount: Int) {
        self.gameMode = gameMode
        self.gameType = gameType
        self.gameStartTimeUtc = gameStartTimeUtc
        self.gameVersion = gameVersion
        self.players = players
        self.totalTurnCount = totalTurnCount
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.gameMode = try RunneteraGameMode(container.decode(String.self, forKey: .gameMode))
        self.gameType = try RunneteraGameType(container.decode(String.self, forKey: .gameType))
        self.gameStartTimeUtc = try container.decode(String.self, forKey: .gameStartTimeUtc)
        self.gameVersion = try container.decode(String.self, forKey: .gameVersion)
        self.players = try container.decode([RunneteraMatchPlayer].self, forKey: .players)
        self.totalTurnCount = try container.decode(Int.self, forKey: .totalTurnCount)
    }
}
