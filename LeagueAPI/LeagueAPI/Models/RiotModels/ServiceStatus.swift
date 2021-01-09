//
//  ServiceStatus.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class ServiceStatus: Decodable {
    
    public var id: String
    public var name: String
    public var locales: [String]
    public var maintenances: [Incident]
    public var incidents: [Incident]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case locales = "locales"
        case maintenances = "maintenances"
        case incidents = "incidents"
    }
    
    public init(id: String, name: String, locales: [String], maintenances: [Incident], incidents: [Incident]) {
        self.id = id
        self.name = name
        self.locales = locales
        self.maintenances = maintenances
        self.incidents = incidents
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.locales = try container.decode([String].self, forKey: .locales)
        self.maintenances = try container.decode([Incident].self, forKey: .maintenances)
        self.incidents = try container.decode([Incident].self, forKey: .incidents)
    }
}
