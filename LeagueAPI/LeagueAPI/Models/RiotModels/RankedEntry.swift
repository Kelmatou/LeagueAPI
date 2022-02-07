//
//  RankedEntry.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 4/28/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

public class RankedEntry: Decodable {
    
    public var leagueId: LeagueId
    public var leagueInfo: LeagueInfo
    public var queue: Queue
    
    enum CodingKeys: String, CodingKey {
        case leagueId = "leagueID"
        case queue = "queueType"
    }
    
    public init(leagueId: LeagueId, leagueName: String, leagueInfo: LeagueInfo, queue: Queue) {
        self.leagueId = leagueId
        self.leagueInfo = leagueInfo
        self.queue = queue
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.leagueId = try LeagueId(container.decode(String.self, forKey: .leagueId))
        self.leagueInfo = try LeagueInfo(from: decoder)
        self.queue = try Queue(container.decode(String.self, forKey: .queue))
    }
}
