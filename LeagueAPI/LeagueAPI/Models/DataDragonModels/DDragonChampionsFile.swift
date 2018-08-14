//
//  DDragonChampionsFile.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DDragonChampionsFile: Decodable {
    
    public var version: String
    public var champions: [String : ChampionsDetails]
    
    enum CodingKeys: String, CodingKey {
        case version = "version"
        case champions = "data"
    }
    
    public init(version: String, champions: [String : ChampionsDetails]) {
        self.version = version
        self.champions = champions
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.version = try container.decode(String.self, forKey: .version)
        self.champions = try container.decode([String : ChampionsDetails].self, forKey: .champions)
    }
}
