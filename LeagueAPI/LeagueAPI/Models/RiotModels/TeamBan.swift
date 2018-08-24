//
//  TeamBan.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class TeamBan: Decodable {
    
    public var banTurn: Int
    public var championId: ChampionId
    
    enum CodingKeys: String, CodingKey {
        case banTurn = "pickTurn"
        case championId = "championId"
    }
    
    public init(banTurn: Int, championId: ChampionId) {
        self.banTurn = banTurn
        self.championId = championId
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.banTurn = try container.decode(Int.self, forKey: .banTurn)
        self.championId = try ChampionId(container.decode(Long.self, forKey: .championId))
    }
}
