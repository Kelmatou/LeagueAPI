//
//  RankedPosition.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class RankedPosition: Decodable {
    
    public var tier: String
    public var leagueId: LeagueId
    public var leagueName: String
    public var leagueInfo: LeagueInfo
    public var queue: Queue
    
    enum CodingKeys: String, CodingKey {
        case tier = "tier"
        case leagueId = "leagueId"
        case leagueName = "leagueName"
        case queue = "queueType"
    }
    
    public init(tier: String, leagueId: LeagueId, leagueName: String, leagueInfo: LeagueInfo, queue: Queue) {
        self.tier = tier
        self.leagueId = leagueId
        self.leagueName = leagueName
        self.leagueInfo = leagueInfo
        self.queue = queue
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tier = try container.decode(String.self, forKey: .tier)
        self.leagueId = try LeagueId(container.decode(String.self, forKey: .leagueId))
        self.leagueName = try container.decode(String.self, forKey: .leagueName)
        self.leagueInfo = try LeagueInfo(from: decoder)
        self.queue = try Queue(container.decode(String.self, forKey: .queue))
    }
}
