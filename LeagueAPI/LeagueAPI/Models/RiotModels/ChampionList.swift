//
//  ChampionList.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ChampionList: Decodable {
    
    public var champions: [Champion]
    
    enum CodingKeys: String, CodingKey {
        case champions = "champions"
    }
    
    public init(champions: [Champion]) {
        self.champions = champions
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.champions = try container.decode([Champion].self, forKey: .champions)
    }
}
