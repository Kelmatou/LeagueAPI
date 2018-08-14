//
//  DDragonChampionFile.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DDragonChampionFile: Decodable {
    
    public var version: String
    public var champion: [String : ChampionAdditionalDetails]
    
    enum CodingKeys: String, CodingKey {
        case version = "version"
        case champion = "data"
    }
    
    public init(version: String, champion: [String : ChampionAdditionalDetails]) {
        self.version = version
        self.champion = champion
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.version = try container.decode(String.self, forKey: .version)
        self.champion = try container.decode([String : ChampionAdditionalDetails].self, forKey: .champion)
    }
}
