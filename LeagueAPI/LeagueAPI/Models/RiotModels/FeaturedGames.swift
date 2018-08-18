//
//  FeaturedGames.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class FeaturedGames: Decodable {
    
    public var refreshInterval: Datetime
    public var games: [GameInfo]
    
    enum CodingKeys: String, CodingKey {
        case refreshInterval = "clientRefreshInterval"
        case games = "gameList"
    }
    
    public init(refreshInterval: Datetime, games: [GameInfo]) {
        self.refreshInterval = refreshInterval
        self.games = games
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let durationMs: Long = try container.decode(Long.self, forKey: .refreshInterval)
        self.refreshInterval = Datetime(timestamp: durationMs)
        self.games = try container.decode([GameInfo].self, forKey: .games)
    }
}
