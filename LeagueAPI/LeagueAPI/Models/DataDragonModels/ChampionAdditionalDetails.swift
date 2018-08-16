//
//  ChampionAdditionalDetails.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ChampionAdditionalDetails: Decodable {
    
    public var skinsData: [SkinData]
    public var lore: String
    
    enum CodingKeys: String, CodingKey {
        case skinsData = "skins"
        case lore = "lore"
    }
    
    public init(skinsData: [SkinData], lore: String) {
        self.skinsData = skinsData
        self.lore = lore
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.skinsData = try container.decode([SkinData].self, forKey: .skinsData)
        self.lore = try container.decode(String.self, forKey: .lore)
    }
}
