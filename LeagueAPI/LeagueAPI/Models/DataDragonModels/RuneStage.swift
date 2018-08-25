//
//  RuneStage.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/25/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class RuneStage: Decodable {
    
    public var runes: [Rune]
    
    enum CodingKeys: String, CodingKey {
        case runes = "runes"
    }
    
    public init(runes: [Rune]) {
        self.runes = runes
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.runes = try container.decode([Rune].self, forKey: .runes)
    }
}
