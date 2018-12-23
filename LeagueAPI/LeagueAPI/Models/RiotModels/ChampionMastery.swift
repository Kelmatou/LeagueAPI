//
//  ChampionMastery.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class ChampionMastery: Decodable {
    
    public var championId: ChampionId
    public var summonerId: SummonerId
    public var championLevel: Int
    public var championPoints: Int
    public var championPointsUntilNextLevel: Long
    public var championPointsSinceLastLevel: Long
    public var chestGranted: Bool
    public var tokensEarned: Int
    public var lastPlayTime: Datetime
    
    enum CodingKeys: String, CodingKey {
        case championId = "championId"
        case summonerId = "summonerId"
        case championLevel = "championLevel"
        case championPoints = "championPoints"
        case championPointsUntilNextLevel = "championPointsUntilNextLevel"
        case championPointsSinceLastLevel = "championPointsSinceLastLevel"
        case chestGranted = "chestGranted"
        case tokensEarned = "tokensEarned"
        case lastPlayTime = "lastPlayTime"
    }
    
    public init(championId: ChampionId, summonerId: SummonerId, championLevel: Int, championPoints: Int, championPointsUntilNextLevel: Long, championPointsSinceLastLevel: Long, chestGranted: Bool, tokensEarned: Int, lastPlayTime: Datetime) {
        self.championId = championId
        self.summonerId = summonerId
        self.championLevel = championLevel
        self.championPoints = championPoints
        self.championPointsUntilNextLevel = championPointsUntilNextLevel
        self.championPointsSinceLastLevel = championPointsSinceLastLevel
        self.chestGranted = chestGranted
        self.tokensEarned = tokensEarned
        self.lastPlayTime = lastPlayTime
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.championId = try ChampionId(container.decode(Long.self, forKey: .championId))
        self.summonerId = try SummonerId(container.decode(String.self, forKey: .summonerId))
        self.championLevel = try container.decode(Int.self, forKey: .championLevel)
        self.championPoints = try container.decode(Int.self, forKey: .championPoints)
        self.championPointsUntilNextLevel = try container.decode(Long.self, forKey: .championPointsUntilNextLevel)
        self.championPointsSinceLastLevel = try container.decode(Long.self, forKey: .championPointsSinceLastLevel)
        self.chestGranted = try container.decode(Bool.self, forKey: .chestGranted)
        self.tokensEarned = try container.decode(Int.self, forKey: .tokensEarned)
        let timestamp: Long = try container.decode(Long.self, forKey: .lastPlayTime)
        self.lastPlayTime = Datetime(timestamp: timestamp)
    }
}
