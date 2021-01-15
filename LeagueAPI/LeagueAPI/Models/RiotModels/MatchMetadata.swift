//
//  MatchMetadata.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 1/15/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

public class MatchMetadata<MatchId: Identifier<String>>: Decodable {
    
    public var dataVersion: String
    public var participants: [SummonerPuuid]
    public var gameId: MatchId
    
    enum CodingKeys: String, CodingKey {
        case dataVersion = "data_version"
        case participants = "participants"
        case gameId = "match_id"
    }
    
    public init(dataVersion: String, participants: [SummonerPuuid], gameId: MatchId) {
        self.dataVersion = dataVersion
        self.participants = participants
        self.gameId = gameId
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dataVersion = try container.decode(String.self, forKey: .dataVersion)
        self.participants = try (container.decode([String].self, forKey: .participants)).map({ return SummonerPuuid($0) })
        self.gameId = try MatchId(container.decode(String.self, forKey: .gameId))
    }
}
