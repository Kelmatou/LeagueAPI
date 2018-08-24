//
//  BannedChampion.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class BannedChampion: Decodable {
    
    public var championId: ChampionId
    public var teamId: Long
    public var banTurn: Int
    
    enum CodingKeys: String, CodingKey {
        case championId = "championId"
        case teamId = "teamId"
        case banTurn = "pickTurn"
    }
    
    public init(championId: ChampionId, teamId: Long, banTurn: Int) {
        self.championId = championId
        self.teamId = teamId
        self.banTurn = banTurn
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.championId = try ChampionId(container.decode(Long.self, forKey: .championId))
        self.teamId = try container.decode(Long.self, forKey: .teamId)
        self.banTurn = try container.decode(Int.self, forKey: .banTurn)
    }
}
