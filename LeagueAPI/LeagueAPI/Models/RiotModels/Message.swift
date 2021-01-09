//
//  Message.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Message: Decodable {
    
    public var id: Long
    public var author: String
    public var publish: Bool
    public var publishLocations: [RiotClientLocation]
    public var translations: [Translation]
    public var createdAt: String
    public var updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case author = "author"
        case publish = "publish"
        case publishLocations = "publish_locations"
        case translations = "translations"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    public init(id: Long, author: String, publish: Bool, publishLocations: [RiotClientLocation], translations: [Translation], createdAt: String, updatedAt: String) {
        self.id = id
        self.author = author
        self.publish = publish
        self.publishLocations = publishLocations
        self.translations = translations
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Long.self, forKey: .id)
        self.author = try container.decode(String.self, forKey: .author)
        self.publish = try container.decode(Bool.self, forKey: .publish)
        self.publishLocations = try container.decode([String].self, forKey: .publishLocations).map({ return RiotClientLocation($0) })
        self.translations = try container.decode([Translation].self, forKey: .translations)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
    }
}
