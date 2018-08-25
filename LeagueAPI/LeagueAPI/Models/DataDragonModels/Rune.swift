//
//  Rune.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/25/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Rune: Decodable {
    
    public var id: RuneId
    public var nameId: String
    public var name: String
    public var image: ImageWithUrl
    public var shortDescription: String
    public var longDescription: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nameId = "key"
        case name = "name"
        case image = "icon"
        case shortDescription = "shortDesc"
        case longDescription = "longDesc"
    }
    
    public init(id: RuneId, nameId: String, name: String, image: ImageWithUrl, shortDescription: String, longDescription: String) {
        self.id = id
        self.nameId = nameId
        self.name = name
        self.image = image
        self.shortDescription = shortDescription
        self.longDescription = longDescription
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try RuneId(container.decode(Long.self, forKey: .id))
        self.nameId = try container.decode(String.self, forKey: .nameId)
        self.name = try container.decode(String.self, forKey: .name)
        let pathToIcon: String = try container.decode(String.self, forKey: .image)
        self.image = ImageWithUrl(url: "\(ServicesUrl.DDragonCdn)/img/\(pathToIcon)", image: nil)
        self.shortDescription = try container.decode(String.self, forKey: .shortDescription)
        self.longDescription = try container.decode(String.self, forKey: .longDescription)
    }
}
