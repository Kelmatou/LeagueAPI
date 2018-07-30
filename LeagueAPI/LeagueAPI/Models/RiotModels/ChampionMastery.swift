//
//  ChampionMastery.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class ChampionMastery: Decodable {
    
    public var championId: Int64
    public var summonerId: Int64
    public var championLevel: Int
    public var championPoints: Int
    public var championPointsUntilNextLevel: Int64
    public var championPointsSinceLastLevel: Int64
    public var chestGranted: Bool
    public var tokensEarned: Int
    public var lastPlayTime: Int64
    
    enum CodingKeys: String, CodingKey {
        case championId = "championId"
        case summonerId = "playerId"
        case championLevel = "championLevel"
        case championPoints = "championPoints"
        case championPointsUntilNextLevel = "championPointsUntilNextLevel"
        case championPointsSinceLastLevel = "championPointsSinceLastLevel"
        case chestGranted = "chestGranted"
        case tokensEarned = "tokensEarned"
        case lastPlayTime = "lastPlayTime"
    }
    
    public init(championId: Int64, summonerId: Int64, championLevel: Int, championPoints: Int, championPointsUntilNextLevel: Int64, championPointsSinceLastLevel: Int64, chestGranted: Bool, tokensEarned: Int, lastPlayTime: Int64) {
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
        self.championId = try container.decode(Int64.self, forKey: .championId)
        self.summonerId = try container.decode(Int64.self, forKey: .summonerId)
        self.championLevel = try container.decode(Int.self, forKey: .championLevel)
        self.championPoints = try container.decode(Int.self, forKey: .championPoints)
        self.championPointsUntilNextLevel = try container.decode(Int64.self, forKey: .championPointsUntilNextLevel)
        self.championPointsSinceLastLevel = try container.decode(Int64.self, forKey: .championPointsSinceLastLevel)
        self.chestGranted = try container.decode(Bool.self, forKey: .chestGranted)
        self.tokensEarned = try container.decode(Int.self, forKey: .tokensEarned)
        self.lastPlayTime = try container.decode(Int64.self, forKey: .lastPlayTime)
    }
}
