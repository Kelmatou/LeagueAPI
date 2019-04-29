//
//  MatchParticipant.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class MatchParticipant: Decodable {
    
    public var participantId: Int
    public var teamId: Int
    public var championId: ChampionId
    public var summonerSpell1: SummonerSpellId
    public var summonerSpell2: SummonerSpellId
    public var highestAchievedSeasonTier: RankedTier?
    public var stats: MatchParticipantStats
    public var timeline: MatchParticipantTimeline
    public var runes: [LegacyRune]?
    public var masteries: [LegacyMastery]?
    
    enum CodingKeys: String, CodingKey {
        case participantId = "participantId"
        case teamId = "teamId"
        case championId = "championId"
        case summonerSpell1 = "spell1Id"
        case summonerSpell2 = "spell2Id"
        case highestAchievedSeasonTier = "highestAchievedSeasonTier"
        case stats = "stats"
        case timeline = "timeline"
        case runes = "runes"
        case masteries = "masteries"
    }
    
    public init(participantId: Int, teamId: Int, championId: ChampionId, summonerSpell1: SummonerSpellId, summonerSpell2: SummonerSpellId, highestAchievedSeasonTier: RankedTier?, stats: MatchParticipantStats, timeline: MatchParticipantTimeline, runes: [LegacyRune]? = nil, masteries: [LegacyMastery]? = nil) {
        self.participantId = participantId
        self.teamId = teamId
        self.championId = championId
        self.summonerSpell1 = summonerSpell1
        self.summonerSpell2 = summonerSpell2
        self.highestAchievedSeasonTier = highestAchievedSeasonTier
        self.stats = stats
        self.timeline = timeline
        self.runes = runes
        self.masteries = masteries
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.participantId = try container.decode(Int.self, forKey: .participantId)
        self.teamId = try container.decode(Int.self, forKey: .teamId)
        self.championId = try ChampionId(container.decode(Long.self, forKey: .championId))
        self.summonerSpell1 = try SummonerSpellId(container.decode(Long.self, forKey: .summonerSpell1))
        self.summonerSpell2 = try SummonerSpellId(container.decode(Long.self, forKey: .summonerSpell2))
        self.highestAchievedSeasonTier = try? RankedTier(container.decode(String.self, forKey: .highestAchievedSeasonTier))
        self.stats = try container.decode(MatchParticipantStats.self, forKey: .stats)
        self.timeline = try container.decode(MatchParticipantTimeline.self, forKey: .timeline)
        self.runes = try? container.decode([LegacyRune].self, forKey: .runes)
        self.masteries = try? container.decode([LegacyMastery].self, forKey: .masteries)
    }
}
