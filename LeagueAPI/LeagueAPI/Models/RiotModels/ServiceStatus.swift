//
//  ServiceStatus.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class ServiceStatus: Decodable {
    
    public var name: String
    public var hostname: String
    public var regionTag: String
    public var services: [Service]
    public var slug: String
    public var locales: [String]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case hostname = "hostname"
        case regionTag = "region_tag"
        case services = "services"
        case slug = "slug"
        case locales = "locales"
    }
    
    public init(name: String, hostname: String, regionTag: String, services: [Service], slug: String, locales: [String]) {
        self.name = name
        self.hostname = hostname
        self.regionTag = regionTag
        self.services = services
        self.slug = slug
        self.locales = locales
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.hostname = try container.decode(String.self, forKey: .hostname)
        self.regionTag = try container.decode(String.self, forKey: .regionTag)
        self.services = try container.decode([Service].self, forKey: .services)
        self.slug = try container.decode(String.self, forKey: .slug)
        self.locales = try container.decode([String].self, forKey: .locales)
    }
}
