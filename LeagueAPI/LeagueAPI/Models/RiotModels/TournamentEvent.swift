//
//  TournamentEvent.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/29/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class TournamentEvent: Decodable {
    
    public var eventType: String
    public var summonerId: String
    public var timestamp: String
    
    enum CodingKeys: String, CodingKey {
        case eventType = "eventType"
        case summonerId = "summonerId"
        case timestamp = "timestamp"
    }
    
    public init(eventType: String, summonerId: String, timestamp: String) {
        self.eventType = eventType
        self.summonerId = summonerId
        self.timestamp = timestamp
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.eventType = try container.decode(String.self, forKey: .eventType)
        self.summonerId = try container.decode(String.self, forKey: .summonerId)
        self.timestamp = try container.decode(String.self, forKey: .timestamp)
    }
}
