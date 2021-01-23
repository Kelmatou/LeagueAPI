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
    public var status: MaintenanceStatus?
    public var severity: IncidentSeverity?
    public var titles: [Translation]
    public var updates: [Message]
    public var createdAt: String
    public var archiveAt: String?
    public var updatedAt: String?
    public var platforms: [DevicePlatform]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "maintenance_status"
        case severity = "incident_severity"
        case titles = "titles"
        case updates = "updates"
        case createdAt = "created_at"
        case archiveAt = "archive_at"
        case updatedAt = "updated_at"
        case platforms = "platforms"
    }
    
    public init(id: Long, status: MaintenanceStatus?, severity: IncidentSeverity?, titles: [Translation], updates: [Message], createdAt: String, archiveAt: String?, updatedAt: String?, platforms: [DevicePlatform]) {
        self.id = id
        self.status = status
        self.severity = severity
        self.titles = titles
        self.updates = updates
        self.createdAt = createdAt
        self.archiveAt = archiveAt
        self.updatedAt = updatedAt
        self.platforms = platforms
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Long.self, forKey: .id)
        self.status = try? MaintenanceStatus(container.decode(String.self, forKey: .status))
        self.severity = try? IncidentSeverity(container.decode(String.self, forKey: .severity))
        self.titles = try container.decode([Translation].self, forKey: .titles)
        self.updates = try container.decode([Message].self, forKey: .updates)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.archiveAt = try? container.decode(String.self, forKey: .archiveAt)
        self.updatedAt = try? container.decode(String.self, forKey: .updatedAt)
        self.platforms = try container.decode([String].self, forKey: .platforms).map({ return DevicePlatform($0) })

    }
}
