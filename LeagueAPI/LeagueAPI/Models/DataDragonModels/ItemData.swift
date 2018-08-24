//
//  ItemData.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/24/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ItemData: Decodable {
    
    public var name: String
    public var presentation: String
    public var description: String
    public var shop: ItemShop
    public var evolutionItemIds: [ItemId]
    public var tags: [String]
    public var availableMaps: [Map]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case presentation = "plaintext"
        case description = "description"
        case shop = "gold"
        case evolutionItemIds = "into"
        case tags = "tags"
        case availableMaps = "maps"
    }
    
    public init(name: String, presentation: String, description: String, shop: ItemShop, evolutionItemIds: [ItemId], tags: [String], availableMaps: [Map]) {
        self.name = name
        self.presentation = presentation
        self.description = description
        self.shop = shop
        self.evolutionItemIds = evolutionItemIds
        self.tags = tags
        self.availableMaps = availableMaps
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.presentation = try container.decode(String.self, forKey: .presentation)
        self.description = try container.decode(String.self, forKey: .description)
        self.shop = try container.decode(ItemShop.self, forKey: .shop)
        let evolutionItemIdsInt: [Int] = try container.decode([Int].self, forKey: .evolutionItemIds)
        self.evolutionItemIds = evolutionItemIdsInt.map { ItemId($0) }
        self.tags = try container.decode([String].self, forKey: .tags)
        let availableMapIds: [Long] = try container.decode([Long].self, forKey: .availableMaps)
        self.availableMaps = availableMapIds.map( { Map($0) } )
    }
}
