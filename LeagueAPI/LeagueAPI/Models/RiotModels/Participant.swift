//
//  Participant.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Participant: Decodable {
    
    public var summonerName: String
    public var profileIconId: ProfileIconId
    public var championId: ChampionId
    public var isBot: Bool
    public var teamId: Long
    public var summonerSpell1: SummonerSpellId
    public var summonerSpell2: SummonerSpellId
    public var summonerId: SummonerId? // Detailed participant field
    public var runePage: RunePage? // Detailed participant field
    public var customizedObjects: [GameCustomObject]? // Detailed participant field
    
    enum CodingKeys: String, CodingKey {
        case summonerName = "summonerName"
        case profileIconId = "profileIconId"
        case championId = "championId"
        case isBot = "bot"
        case teamId = "teamId"
        case summonerSpell1 = "spell1Id"
        case summonerSpell2 = "spell2Id"
        case summonerId = "summonerId"
        case runePage = "perks"
        case customizedObjects = "gameCustomizationObjects"
    }
    
    public init(summonerName: String, profileIconId: ProfileIconId, championId: ChampionId, isBot: Bool, teamId: Long, summonerSpell1: SummonerSpellId, summonerSpell2: SummonerSpellId, summonerId: SummonerId? = nil, runePage: RunePage? = nil, customizedObjects: [GameCustomObject]? = nil) {
        self.summonerName = summonerName
        self.profileIconId = profileIconId
        self.championId = championId
        self.isBot = isBot
        self.teamId = teamId
        self.summonerSpell1 = summonerSpell1
        self.summonerSpell2 = summonerSpell2
        self.summonerId = summonerId
        self.runePage = runePage
        self.customizedObjects = customizedObjects
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.summonerName = try container.decode(String.self, forKey: .summonerName)
        self.profileIconId = try ProfileIconId(container.decode(Long.self, forKey: .profileIconId))
        self.championId = try ChampionId(container.decode(Long.self, forKey: .championId))
        self.isBot = try container.decode(Bool.self, forKey: .isBot)
        self.teamId = try container.decode(Long.self, forKey: .teamId)
        self.summonerSpell1 = try SummonerSpellId(container.decode(Long.self, forKey: .summonerSpell1))
        self.summonerSpell2 = try SummonerSpellId(container.decode(Long.self, forKey: .summonerSpell2))
        self.summonerId = try? SummonerId(container.decode(String.self, forKey: .summonerId))
        self.runePage = try? container.decode(RunePage.self, forKey: .runePage)
        self.customizedObjects = try? container.decode([GameCustomObject].self, forKey: .customizedObjects)
    }
}
