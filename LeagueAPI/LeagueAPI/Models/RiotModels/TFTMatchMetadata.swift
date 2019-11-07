//
//  TFTMatchMetadata.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/6/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

public class TFTMatchMetadata: Decodable {
    
    public var dataVersion: String
    public var participants: [SummonerPuuid]
    public var gameId: TFTGameId
    
    enum CodingKeys: String, CodingKey {
        case dataVersion = "data_version"
        case participants = "participants"
        case gameId = "match_id"
    }
    
    public init(dataVersion: String, participants: [SummonerPuuid], gameId: TFTGameId) {
        self.dataVersion = dataVersion
        self.participants = participants
        self.gameId = gameId
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dataVersion = try container.decode(String.self, forKey: .dataVersion)
        self.participants = try (container.decode([String].self, forKey: .participants)).map({ return SummonerPuuid($0) })
        self.gameId = try TFTGameId(container.decode(String.self, forKey: .gameId))
    }
}
