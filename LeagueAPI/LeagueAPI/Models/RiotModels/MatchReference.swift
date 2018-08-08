//
//  MatchReference.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class MatchReference: Decodable {
    
    public var gameId: Int64
    public var season: Int
    public var queue: Int
    public var championId: Int
    public var lane: String
    public var role: String
    public var platformId: String
    public var gameDate: Int64
    
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
    
    public init(gameId: Int64, season: Int, queue: Int, championId: Int, lane: String, role: String, platformId: String, gameDate: Int64) {
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
        self.gameId = try container.decode(Int64.self, forKey: .gameId)
        self.season = try container.decode(Int.self, forKey: .season)
        self.queue = try container.decode(Int.self, forKey: .queue)
        self.championId = try container.decode(Int.self, forKey: .championId)
        self.lane = try container.decode(String.self, forKey: .lane)
        self.role = try container.decode(String.self, forKey: .role)
        self.platformId = try container.decode(String.self, forKey: .platformId)
        self.gameDate = try container.decode(Int64.self, forKey: .gameDate)
    }
}
