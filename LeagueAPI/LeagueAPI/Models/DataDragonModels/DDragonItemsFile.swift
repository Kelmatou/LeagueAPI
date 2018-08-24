//
//  DDragonItemsFile.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/24/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DDragonItemsFile: Decodable {
    
    public var version: String
    public var items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case version = "version"
        case items = "data"
    }
    
    public init(version: String, items: [Item]) {
        self.version = version
        self.items = items
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let version = try container.decode(String.self, forKey: .version)
        self.version = version
        let itemsData: [String : ItemData] = try container.decode([String : ItemData].self, forKey: .items)
        self.items = itemsData.map { (dictionary) in
            let (key, value) = dictionary
            return Item(id: ItemId(Int(key)!), data: value, version: version)
        }
    }
}
