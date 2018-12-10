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
    public var summonerId: SummonerId?
    public var timestamp: String
    
    enum CodingKeys: String, CodingKey {
        case eventType = "eventType"
        case summonerId = "summonerId"
        case timestamp = "timestamp"
    }
    
    public init(eventType: String, summonerId: SummonerId, timestamp: String) {
        self.eventType = eventType
        self.summonerId = summonerId
        self.timestamp = timestamp
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.eventType = try container.decode(String.self, forKey: .eventType)
        let summonerIdStr: String? = try container.decode(String?.self, forKey: .summonerId)
        if let summonerIdStr = summonerIdStr {
            self.summonerId = SummonerId(summonerIdStr)
        }
        self.timestamp = try container.decode(String.self, forKey: .timestamp)
    }
}
