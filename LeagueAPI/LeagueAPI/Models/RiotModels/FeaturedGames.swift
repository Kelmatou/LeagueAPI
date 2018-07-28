//
//  FeaturedGames.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class FeaturedGames: Decodable {
    
    public var refreshInterval: Double
    public var games: [GameInfo]
    
    enum CodingKeys: String, CodingKey {
        case refreshInterval = "clientRefreshInterval"
        case games = "gameList"
    }
    
    public init(refreshInterval: Double, games: [GameInfo]) {
        self.refreshInterval = refreshInterval
        self.games = games
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.refreshInterval = try container.decode(Double.self, forKey: .refreshInterval)
        self.games = try container.decode([GameInfo].self, forKey: .games)
    }
}
