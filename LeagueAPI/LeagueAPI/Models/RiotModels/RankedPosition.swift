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
    public var leagueId: String
    public var leagueName: String
    public var leagueInfo: LeagueInfo
    public var queue: Queue
    
    enum CodingKeys: String, CodingKey {
        case playerOrTeamId = "playerOrTeamId"
        case playerOrTeamName = "playerOrTeamName"
        case tier = "tier"
        case rank = "rank"
        case leagueId = "leagueId"
        case leagueName = "leagueName"
        case leaguePoints = "leaguePoints"
        case series = "miniSeries"
        case queue = "queueType"
        case wins = "wins"
        case losses = "losses"
        case hotStreak = "hotStreak"
        case veteran = "veteran"
        case freshBlood = "freshBlood"
        case inactive = "inactive"
    }
    
    public init(tier: String, leagueId: String, leagueName: String, leagueInfo: LeagueInfo, queue: Queue) {
        self.tier = tier
        self.leagueId = leagueId
        self.leagueName = leagueName
        self.leagueInfo = leagueInfo
        self.queue = queue
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let playerOrTeamId: String = try container.decode(String.self, forKey: .playerOrTeamId)
        let playerOrTeamName: String = try container.decode(String.self, forKey: .playerOrTeamName)
        let rank: String = try container.decode(String.self, forKey: .rank)
        let leaguePoints: Int = try container.decode(Int.self, forKey: .leaguePoints)
        let series: Series = try container.decode(Series.self, forKey: .series)
        let wins: Int = try container.decode(Int.self, forKey: .wins)
        let losses: Int = try container.decode(Int.self, forKey: .losses)
        let hotStreak: Bool = try container.decode(Bool.self, forKey: .hotStreak)
        let veteran: Bool = try container.decode(Bool.self, forKey: .veteran)
        let freshBlood: Bool = try container.decode(Bool.self, forKey: .freshBlood)
        let inactive: Bool = try container.decode(Bool.self, forKey: .inactive)
        self.tier = try container.decode(String.self, forKey: .tier)
        self.leagueId = try container.decode(String.self, forKey: .leagueId)
        self.leagueName = try container.decode(String.self, forKey: .leagueName)
        self.leagueInfo = LeagueInfo(playerOrTeamId: playerOrTeamId, playerOrTeamName: playerOrTeamName, rank: rank, leaguePoints: leaguePoints, series: series, wins: wins, losses: losses, hotStreak: hotStreak, veteran: veteran, freshBlood: freshBlood, inactive: inactive)
        self.queue = try Queue(queueType: container.decode(String.self, forKey: .queue))
    }
}
