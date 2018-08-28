//
//  TournamentUpdate.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class TournamentUpdate: Encodable {
    
    public var spectatorType: SpectatorType
    public var pickType: PickType
    public var allowedSummonerIds: [SummonerId]?
    public var mapType: MapType
    
    enum CodingKeys: String, CodingKey {
        case spectatorType = "spectatorType"
        case pickType = "pickType"
        case allowedSummonerIds = "allowedSummonerIds"
        case mapType = "mapType"
    }
    
    public init(spectatorType: SpectatorType, pickType: PickType, allowedSummonerIds: [SummonerId]? = nil, mapType: MapType) {
        self.spectatorType = spectatorType
        self.pickType = pickType
        self.allowedSummonerIds = allowedSummonerIds
        self.mapType = mapType
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.spectatorType.type.rawValue, forKey: .spectatorType)
        try container.encode(self.pickType.type.rawValue, forKey: .pickType)
        if let allowedSummonerIds = self.allowedSummonerIds {
            try container.encode(allowedSummonerIds.map { $0.value }, forKey: .allowedSummonerIds)
        }
        try container.encode(self.mapType.type.rawValue, forKey: .mapType)
    }
}
