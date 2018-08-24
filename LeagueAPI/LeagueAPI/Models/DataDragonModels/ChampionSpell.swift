//
//  ChampionSpell.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/24/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class ChampionSpell {
    
    public var id: String
    public var name: String
    public var description: String
    public var image: ImageWithUrl
    public var cooldowns: [Duration]
    public var costs: [Int]
    public var costType: String
    public var ranges: [Int]
    public var maxRank: Int
    
    public init(id: String, name: String, description: String, image: ImageWithUrl, cooldowns: [Duration], costs: [Int], costType: String, ranges: [Int], maxRank: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.cooldowns = cooldowns
        self.costs = costs
        self.costType = costType
        self.ranges = ranges
        self.maxRank = maxRank
    }
    
    internal init(from data: ChampionSpellData, version: String) {
        self.id = data.id
        self.name = data.name
        self.description = data.description
        self.image = ImageWithUrl(url: "\(ServicesUrl.DDragonCdn)/\(version)/img/spell/\(data.id).png", image: nil)
        self.cooldowns = data.cooldowns
        self.costs = data.costs
        self.costType = data.costType
        self.ranges = data.ranges
        self.maxRank = data.maxRank
    }
}
