//
//  DDragonSummonerSpellsFile.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/23/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DDragonSummonerSpellsFile: Decodable {
    
    public var version: String
    public var summonerSpells: [SummonerSpell]
    
    enum CodingKeys: String, CodingKey {
        case version = "version"
        case summonerSpells = "data"
    }
    
    public init(version: String, summonerSpells: [SummonerSpell]) {
        self.version = version
        self.summonerSpells = summonerSpells
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let version = try container.decode(String.self, forKey: .version)
        self.version = version
        let summonerSpellsData: [String : SummonerSpellData] = try container.decode([String : SummonerSpellData].self, forKey: .summonerSpells)
        self.summonerSpells = summonerSpellsData.map { SummonerSpell(data: $0.value, version: version) }
    }
}
