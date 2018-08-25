//
//  ChampionSpellData.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/24/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ChampionSpellData: Decodable {
    
    public var id: String
    public var name: String
    public var description: String
    public var cooldowns: [Duration]
    public var costs: [Int]
    public var costType: String
    public var ranges: [Int]
    public var maxRank: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case maxRank = "maxrank"
        case cooldowns = "cooldown"
        case costs = "cost"
        case costType = "costType"
        case ranges = "range"
    }
    
    public init(id: String, name: String, description: String, cooldowns: [Duration], costs: [Int], costType: String, ranges: [Int], maxRank: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.cooldowns = cooldowns
        self.costs = costs
        self.costType = costType
        self.ranges = ranges
        self.maxRank = maxRank
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        let cooldownValues: [Double] = try container.decode([Double].self, forKey: .cooldowns)
        self.cooldowns = cooldownValues.map { Duration(seconds: $0) }
        self.costs = try container.decode([Int].self, forKey: .costs)
        self.costType = try container.decode(String.self, forKey: .costType)
        self.ranges = try container.decode([Int].self, forKey: .ranges)
        self.maxRank = try container.decode(Int.self, forKey: .maxRank)
    }
}
