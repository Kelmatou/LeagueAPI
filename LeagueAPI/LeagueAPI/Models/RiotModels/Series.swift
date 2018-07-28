//
//  Series.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Series: Decodable {
    
    public var wins: Int
    public var losses: Int
    public var target: Int
    public var progress: String
    
    enum CodingKeys: String, CodingKey {
        case wins = "wins"
        case losses = "losses"
        case target = "target"
        case progress = "progress"
    }
    
    public init(wins: Int, losses: Int, target: Int, progress: String) {
        self.wins = wins
        self.losses = losses
        self.target = target
        self.progress = progress
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.wins = try container.decode(Int.self, forKey: .wins)
        self.losses = try container.decode(Int.self, forKey: .losses)
        self.target = try container.decode(Int.self, forKey: .target)
        self.progress = try container.decode(String.self, forKey: .progress)
    }
}
