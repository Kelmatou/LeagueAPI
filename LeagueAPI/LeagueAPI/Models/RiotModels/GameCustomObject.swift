//
//  GameCustomObject.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class GameCustomObject: Decodable {
    
    public var category: String
    public var content: String
    
    enum CodingKeys: String, CodingKey {
        case category = "category"
        case content = "content"
    }
    
    public init(category: String, content: String) {
        self.category = category
        self.content = content
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.category = try container.decode(String.self, forKey: .category)
        self.content = try container.decode(String.self, forKey: .content)
    }
}
