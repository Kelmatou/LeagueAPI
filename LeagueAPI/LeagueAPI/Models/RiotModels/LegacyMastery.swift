//
//  LegacyMastery.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class LegacyMastery: Decodable {
    
    public var masteryId: Int
    public var rank: Int
    
    enum CodingKeys: String, CodingKey {
        case masteryId = "masteryId"
        case rank = "rank"
    }
    
    public init(masteryId: Int, rank: Int) {
        self.masteryId = masteryId
        self.rank = rank
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.masteryId = try container.decode(Int.self, forKey: .masteryId)
        self.rank = try container.decode(Int.self, forKey: .rank)
    }
}
