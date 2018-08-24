//
//  League.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class League: Decodable {
    
    public var leagueId: LeagueId
    public var name: String
    public var tier: String
    public var queue: Queue
    public var leagueInfoList: [LeagueInfo]
    
    enum CodingKeys: String, CodingKey {
        case leagueId = "leagueId"
        case name = "name"
        case tier = "tier"
        case queue = "queue"
        case leagueInfoList = "entries"
    }
    
    public init(leagueId: LeagueId, name: String, tier: String, queue: Queue, leagueInfoList: [LeagueInfo]) {
        self.leagueId = leagueId
        self.name = name
        self.tier = tier
        self.queue = queue
        self.leagueInfoList = leagueInfoList
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.leagueId = try LeagueId(container.decode(String.self, forKey: .leagueId))
        self.name = try container.decode(String.self, forKey: .name)
        self.tier = try container.decode(String.self, forKey: .tier)
        self.queue = try Queue(container.decode(String.self, forKey: .queue))
        self.leagueInfoList = try container.decode([LeagueInfo].self, forKey: .leagueInfoList)
    }
}
