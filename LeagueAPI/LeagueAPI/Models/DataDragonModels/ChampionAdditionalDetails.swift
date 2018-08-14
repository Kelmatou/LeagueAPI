//
//  ChampionAdditionalDetails.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ChampionAdditionalDetails: Decodable {
    
    public var skins: [Skin]
    public var lore: String
    
    enum CodingKeys: String, CodingKey {
        case skins = "skins"
        case lore = "lore"
    }
    
    public init(skins: [Skin], lore: String) {
        self.skins = skins
        self.lore = lore
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.skins = try container.decode([Skin].self, forKey: .skins)
        self.lore = try container.decode(String.self, forKey: .lore)
    }
}
