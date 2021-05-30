//
//  RunneteraDeck.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 5/30/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

public class RunneteraDeck: Decodable {
    
    public var id: RunneteraDeckId
    public var name: String
    public var code: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case code = "code"
    }
    
    public init(id: RunneteraDeckId, name: String, code: String) {
        self.id = id
        self.name = name
        self.code = code
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try RunneteraDeckId(container.decode(String.self, forKey: .id))
        self.name = try container.decode(String.self, forKey: .name)
        self.code = try container.decode(String.self, forKey: .code)
    }
}
