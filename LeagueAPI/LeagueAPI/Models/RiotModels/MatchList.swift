//
//  MatchList.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class MatchList: Decodable {
    
    public var totalGames: Int
    public var startIndex: Int
    public var endIndex: Int
    public var matches: [MatchReference]
    
    enum CodingKeys: String, CodingKey {
        case totalGames = "totalGames"
        case startIndex = "startIndex"
        case endIndex = "endIndex"
        case matches = "matches"
    }
    
    public init(totalGames: Int, startIndex: Int, endIndex: Int, matches: [MatchReference]) {
        self.totalGames = totalGames
        self.startIndex = startIndex
        self.endIndex = endIndex
        self.matches = matches
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalGames = try container.decode(Int.self, forKey: .totalGames)
        self.startIndex = try container.decode(Int.self, forKey: .startIndex)
        self.endIndex = try container.decode(Int.self, forKey: .endIndex)
        self.matches = try container.decode([MatchReference].self, forKey: .matches)
    }
}
