//
//  MatchReference.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class MatchReference: Decodable {
    
    public var gameId: GameId
    public var season: Int
    public var queue: QueueMode
    public var championId: ChampionId
    public var lane: String
    public var role: String
    public var platformId: String
    public var gameDate: Datetime
    
    enum CodingKeys: String, CodingKey {
        case gameId = "gameId"
        case season = "season"
        case queue = "queue"
        case championId = "champion"
        case lane = "lane"
        case role = "role"
        case platformId = "platformId"
        case gameDate = "timestamp"
    }
    
    public init(gameId: GameId, season: Int, queue: QueueMode, championId: ChampionId, lane: String, role: String, platformId: String, gameDate: Datetime) {
        self.gameId = gameId
        self.season = season
        self.queue = queue
        self.championId = championId
        self.lane = lane
        self.role = role
        self.platformId = platformId
        self.gameDate = gameDate
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.gameId = try GameId(container.decode(Long.self, forKey: .gameId))
        self.season = try container.decode(Int.self, forKey: .season)
        self.queue = try QueueMode(container.decode(Long.self, forKey: .queue))
        self.championId = try ChampionId(container.decode(Long.self, forKey: .championId))
        self.lane = try container.decode(String.self, forKey: .lane)
        self.role = try container.decode(String.self, forKey: .role)
        self.platformId = try container.decode(String.self, forKey: .platformId)
        let timestamp: Long = try container.decode(Long.self, forKey: .gameDate)
        self.gameDate = Datetime(timestamp: timestamp)
    }
}
