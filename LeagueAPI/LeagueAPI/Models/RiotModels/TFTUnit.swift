//
//  TFTUnit.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/6/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

public class TFTUnit: Decodable {
    
    public var tier: Int
    public var itemsId: [TFTItemId]
    public var characterId: TFTCharacterId?
    public var name: String
    public var rarity: Int?
    
    enum CodingKeys: String, CodingKey {
        case tier = "tier"
        case itemsId = "items"
        case characterId = "character_id"
        case name = "name"
        case rarity = "rarity"
    }
    
    public init(tier: Int, itemsId: [TFTItemId], characterId: TFTCharacterId?, name: String, rarity: Int?) {
        self.tier = tier
        self.itemsId = itemsId
        self.characterId = characterId
        self.name = name
        self.rarity = rarity
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tier = try container.decode(Int.self, forKey: .tier)
        self.itemsId = try container.decode([Int].self, forKey: .itemsId).map({ TFTItemId($0) })
        self.characterId = try? TFTCharacterId(container.decode(Int.self, forKey: .characterId))
        self.name = try container.decode(String.self, forKey: .name)
        self.rarity = try? container.decode(Int.self, forKey: .rarity)
    }
}
