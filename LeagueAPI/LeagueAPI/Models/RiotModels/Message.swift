//
//  Message.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Message: Decodable {
    
    public var id: String
    public var author: String
    public var content: String
    public var severity: String
    public var translations: [Translation]
    public var createdAt: String
    public var updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case author = "author"
        case content = "content"
        case severity = "severity"
        case translations = "translations"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    public init(id: String, author: String, content: String, severity: String, translations: [Translation], createdAt: String, updatedAt: String) {
        self.id = id
        self.author = author
        self.content = content
        self.severity = severity
        self.translations = translations
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.author = try container.decode(String.self, forKey: .author)
        self.content = try container.decode(String.self, forKey: .content)
        self.severity = try container.decode(String.self, forKey: .severity)
        self.translations = try container.decode([Translation].self, forKey: .translations)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
    }
}
