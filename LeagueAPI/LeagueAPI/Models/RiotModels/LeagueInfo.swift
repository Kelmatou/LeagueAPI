//
//  LeagueInfo.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class LeagueInfo: Decodable {
    
    public var summonerId: SummonerId
    public var summonerName: String
    public var rank: String
    public var leaguePoints: Int
    public var series: Series?
    public var wins: Int
    public var losses: Int
    public var hotStreak: Bool
    public var veteran: Bool
    public var freshBlood: Bool
    public var inactive: Bool
    
    enum CodingKeys: String, CodingKey {
        case summonerId = "summonerId"
        case summonerName = "summonerName"
        case rank = "rank"
        case leaguePoints = "leaguePoints"
        case series = "miniSeries"
        case wins = "wins"
        case losses = "losses"
        case hotStreak = "hotStreak"
        case veteran = "veteran"
        case freshBlood = "freshBlood"
        case inactive = "inactive"
    }
    
    public init(summonerId: SummonerId, summonerName: String, rank: String, leaguePoints: Int, series: Series?, wins: Int, losses: Int, hotStreak: Bool, veteran: Bool, freshBlood: Bool, inactive: Bool) {
        self.summonerId = summonerId
        self.summonerName = summonerName
        self.rank = rank
        self.leaguePoints = leaguePoints
        self.series = series
        self.wins = wins
        self.losses = losses
        self.hotStreak = hotStreak
        self.veteran = veteran
        self.freshBlood = freshBlood
        self.inactive = inactive
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.summonerId = try SummonerId(container.decode(String.self, forKey: .summonerId))
        self.summonerName = try container.decode(String.self, forKey: .summonerName)
        self.rank = try container.decode(String.self, forKey: .rank)
        self.leaguePoints = try container.decode(Int.self, forKey: .leaguePoints)
        self.series = try? container.decode(Series.self, forKey: .series)
        self.wins = try container.decode(Int.self, forKey: .wins)
        self.losses = try container.decode(Int.self, forKey: .losses)
        self.hotStreak = try container.decode(Bool.self, forKey: .hotStreak)
        self.veteran = try container.decode(Bool.self, forKey: .veteran)
        self.freshBlood = try container.decode(Bool.self, forKey: .freshBlood)
        self.inactive = try container.decode(Bool.self, forKey: .inactive)
    }
}
