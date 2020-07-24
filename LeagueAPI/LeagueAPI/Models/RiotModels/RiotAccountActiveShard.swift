//
//  RiotAccountActiveShard.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/20/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public class RiotAccountActiveShard: Decodable {
    
    public var puuid: SummonerPuuid
    public var game: ShardGame
    public var shard: String
    
    enum CodingKeys: String, CodingKey {
        case puuid = "puuid"
        case game = "game"
        case shard = "activeShard"
    }
    
    public init(puuid: SummonerPuuid, game: ShardGame, shard: String) {
        self.puuid = puuid
        self.game = game
        self.shard = shard
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.puuid = try SummonerPuuid(container.decode(String.self, forKey: .puuid))
        self.game = try ShardGame(container.decode(String.self, forKey: .game))
        self.shard = try container.decode(String.self, forKey: .shard)
    }
}
