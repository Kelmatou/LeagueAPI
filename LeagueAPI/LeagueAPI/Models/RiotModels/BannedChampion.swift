//
//  BannedChampion.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class BannedChampion: Decodable {
    
    public var championId: Int64
    public var teamId: Int64
    public var banTurn: Int
    
    enum CodingKeys: String, CodingKey {
        case championId = "championId"
        case teamId = "teamId"
        case banTurn = "pickTurn"
    }
    
    public init(championId: Int64, teamId: Int64, banTurn: Int) {
        self.championId = championId
        self.teamId = teamId
        self.banTurn = banTurn
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.championId = try container.decode(Int64.self, forKey: .championId)
        self.teamId = try container.decode(Int64.self, forKey: .teamId)
        self.banTurn = try container.decode(Int.self, forKey: .banTurn)
    }
}
