//
//  LegacyRune.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class LegacyRune: Decodable {
    
    public var runeId: Int
    public var rank: Int
    
    enum CodingKeys: String, CodingKey {
        case runeId = "runeId"
        case rank = "rank"
    }
    
    public init(runeId: Int, rank: Int) {
        self.runeId = runeId
        self.rank = rank
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.runeId = try container.decode(Int.self, forKey: .runeId)
        self.rank = try container.decode(Int.self, forKey: .rank)
    }
}
