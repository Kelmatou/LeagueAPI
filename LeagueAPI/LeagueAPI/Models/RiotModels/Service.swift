//
//  Service.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Service: Decodable {
    
    public var name: String
    public var status: String
    public var incidents: [Incident]
    public var slug: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case status = "status"
        case incidents = "incidents"
        case slug = "slug"
    }
    
    public init(name: String, status: String, incidents: [Incident], slug: String) {
        self.name = name
        self.status = status
        self.incidents = incidents
        self.slug = slug
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.status = try container.decode(String.self, forKey: .status)
        self.incidents = try container.decode([Incident].self, forKey: .incidents)
        self.slug = try container.decode(String.self, forKey: .slug)
    }
}
