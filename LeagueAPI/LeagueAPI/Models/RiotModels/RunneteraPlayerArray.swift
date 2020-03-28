//
//  RunneteraPlayerArray.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 3/28/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public class RunneteraPlayerArray: Decodable {
    
    public var players: [RunneteraPlayer]
    
    enum CodingKeys: String, CodingKey {
        case players = "players"
    }
    
    public init(players: [RunneteraPlayer]) {
        self.players = players
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.players = try container.decode([RunneteraPlayer].self, forKey: .players)
    }
}
