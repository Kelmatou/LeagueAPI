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
    public var teamId: Int64
    public var summonerSpell1: Int64
    public var summonerSpell2: Int64
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
    
    public init(summonerName: String, profileIconId: ProfileIconId, championId: ChampionId, isBot: Bool, teamId: Int64, summonerSpell1: Int64, summonerSpell2: Int64, summonerId: SummonerId? = nil, runePage: RunePage? = nil, customizedObjects: [GameCustomObject]? = nil) {
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
        self.profileIconId = try container.decode(ProfileIconId.self, forKey: .profileIconId)
        self.championId = try container.decode(ChampionId.self, forKey: .championId)
        self.isBot = try container.decode(Bool.self, forKey: .isBot)
        self.teamId = try container.decode(Int64.self, forKey: .teamId)
        self.summonerSpell1 = try container.decode(Int64.self, forKey: .summonerSpell1)
        self.summonerSpell2 = try container.decode(Int64.self, forKey: .summonerSpell2)
        self.summonerId = try? container.decode(SummonerId.self, forKey: .summonerId)
        self.runePage = try? container.decode(RunePage.self, forKey: .runePage)
        self.customizedObjects = try? container.decode([GameCustomObject].self, forKey: .customizedObjects)
    }
}
