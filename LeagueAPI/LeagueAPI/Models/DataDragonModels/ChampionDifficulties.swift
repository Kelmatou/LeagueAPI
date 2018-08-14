//
//  ChampionDifficulties.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class ChampionDifficulties: Decodable {
    
    public var attack: Int
    public var defense: Int
    public var magic: Int
    public var globalDifficulty: Int
    
    enum CodingKeys: String, CodingKey {
        case attack = "attack"
        case defense = "defense"
        case magic = "magic"
        case globalDifficulty = "difficulty"
    }
    
    public init(attack: Int, defense: Int, magic: Int, globalDifficulty: Int) {
        self.attack = attack
        self.defense = defense
        self.magic = magic
        self.globalDifficulty = globalDifficulty
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attack = try container.decode(Int.self, forKey: .attack)
        self.defense = try container.decode(Int.self, forKey: .defense)
        self.magic = try container.decode(Int.self, forKey: .magic)
        self.globalDifficulty = try container.decode(Int.self, forKey: .globalDifficulty)
    }
}
