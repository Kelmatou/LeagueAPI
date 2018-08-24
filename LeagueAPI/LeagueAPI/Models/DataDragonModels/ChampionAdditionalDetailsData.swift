//
//  ChampionAdditionalDetailsData.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/17/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ChampionAdditionalDetailsData: Decodable {
    
    public var championIdName: String
    public var skinsData: [SkinData]
    public var lore: String
    public var spells: [ChampionSpellData]
    
    enum CodingKeys: String, CodingKey {
        case championIdName = "id"
        case skinsData = "skins"
        case lore = "lore"
        case spells = "spells"
    }
    
    public init(championIdName: String, skinsData: [SkinData], lore: String, spells: [ChampionSpellData]) {
        self.championIdName = championIdName
        self.skinsData = skinsData
        self.lore = lore
        self.spells = spells
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.championIdName = try container.decode(String.self, forKey: .championIdName)
        self.skinsData = try container.decode([SkinData].self, forKey: .skinsData)
        self.lore = try container.decode(String.self, forKey: .lore)
        self.spells = try container.decode([ChampionSpellData].self, forKey: .spells)
    }
}
