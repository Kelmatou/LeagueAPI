//
//  Item.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/24/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

// Maybe add class with stats values (not provided by Riot)
public class Item {
    
    public var id: ItemId
    public var name: String
    public var presentation: String
    public var description: String
    public var image: ImageWithUrl
    public var shop: ItemShop
    public var composedByItemIds: [ItemId]
    public var evolutionItemIds: [ItemId]
    public var tags: [String]
    public var availableMaps: [Map]
    
    public init(id: ItemId, name: String, presentation: String, description: String, image: ImageWithUrl, shop: ItemShop, composedByItemIds: [ItemId], evolutionItemIds: [ItemId], purchasable: Bool, tags: [String], availableMaps: [Map]) {
        self.id = id
        self.name = name
        self.presentation = presentation
        self.description = description
        self.image = image
        self.shop = shop
        self.composedByItemIds = composedByItemIds
        self.evolutionItemIds = evolutionItemIds
        self.tags = tags
        self.availableMaps = availableMaps
    }
    
    internal init(id: ItemId, data: ItemData, version: String) {
        self.id = id
        self.name = data.name
        self.presentation = data.presentation
        self.description = data.description
        self.image = ImageWithUrl(url: "\(ServicesUrl.DDragonCdn)/\(version)/img/item/\(id).png", image: nil)
        self.shop = data.shop
        self.composedByItemIds = data.composedByItemIds
        self.evolutionItemIds = data.evolutionItemIds
        self.tags = data.tags
        self.availableMaps = data.availableMaps
    }
}
