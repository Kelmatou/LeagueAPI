//
//  Incident.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Incident: Decodable {
    
    public var id: Long
    public var active: Bool
    public var updates: [Message]
    public var createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case active = "active"
        case updates = "updates"
        case createdAt = "created_at"
    }
    
    public init(id: Long, active: Bool, updates: [Message], createdAt: String) {
        self.id = id
        self.active = active
        self.updates = updates
        self.createdAt = createdAt
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Long.self, forKey: .id)
        self.active = try container.decode(Bool.self, forKey: .active)
        self.updates = try container.decode([Message].self, forKey: .updates)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
    }
}
