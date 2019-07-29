//
//  Translation.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Translation: Decodable {
    
    public var locale: String
    public var content: String
    public var heading: String
    
    enum CodingKeys: String, CodingKey {
        case locale = "locale"
        case content = "content"
        case heading = "heading"
    }
    
    public init(locale: String, content: String, heading: String) {
        self.locale = locale
        self.content = content
        self.heading = heading
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.locale = try container.decode(String.self, forKey: .locale)
        self.content = try container.decode(String.self, forKey: .content)
        self.heading = (try container.decode(String?.self, forKey: .heading)) ?? ""
    }
}
