//
//  SummonerSpellData.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/23/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class SummonerSpellData: Decodable {
    
    public var id: SummonerSpellId
    public var nameId: String
    public var name: String
    public var description: String
    public var cooldown: Double
    public var range: Int
    public var unlockLevel: Int
    public var availableGameModes: [GameMode]
    
    enum CodingKeys: String, CodingKey {
        case id = "key"
        case nameId = "id"
        case name = "name"
        case description = "description"
        case cooldown = "cooldownBurn"
        case unlockLevel = "summonerLevel"
        case gameModes = "modes"
        case range = "rangeBurn"
    }
    
    public init(id: SummonerSpellId, nameId: String, name: String, description: String, cooldown: Double, range: Int, unlockLevel: Int, availableGameModes: [GameMode]) {
        self.id = id
        self.nameId = nameId
        self.name = name
        self.description = description
        self.cooldown = cooldown
        self.range = range
        self.unlockLevel = unlockLevel
        self.availableGameModes = availableGameModes
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try SummonerSpellId(Long(container.decode(String.self, forKey: .id))!)
        self.nameId = try container.decode(String.self, forKey: .nameId)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.cooldown = try Double(container.decode(String.self, forKey: .cooldown))!
        self.range = try Int(container.decode(String.self, forKey: .range))!
        self.unlockLevel = try container.decode(Int.self, forKey: .unlockLevel)
        let gameModesStr: [String] = try container.decode([String].self, forKey: .gameModes)
        self.availableGameModes = gameModesStr.map { GameMode($0) }
    }
}
