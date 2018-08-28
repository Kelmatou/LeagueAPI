//
//  TournamentInfo.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/29/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class TournamentInfo: Encodable {
    
    public var spectatorType: SpectatorType
    public var teamSize: Int
    public var pickType: PickType
    public var allowedSummonerIds: [SummonerId]?
    public var mapType: MapType
    public var metadata: String?
    
    enum CodingKeys: String, CodingKey {
        case spectatorType = "spectatorType"
        case teamSize = "teamSize"
        case pickType = "pickType"
        case allowedSummonerIds = "allowedSummonerIds"
        case mapType = "mapType"
        case metadata = "metadata"
    }
    
    public init?(spectatorType: SpectatorType, teamSize: Int, pickType: PickType, allowedSummonerIds: [SummonerId]? = nil, mapType: MapType, metadata: String? = nil) {
        guard teamSize >= 1 && teamSize <= 5 else {
            Logger.error("Cannot create TournamentInfo with teamSize=\(teamSize). Valid values are 1-5.")
            return nil
        }
        self.spectatorType = spectatorType
        self.teamSize = teamSize
        self.pickType = pickType
        self.allowedSummonerIds = allowedSummonerIds
        self.mapType = mapType
        self.metadata = metadata
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.spectatorType.type.rawValue, forKey: .spectatorType)
        try container.encode(self.teamSize, forKey: .teamSize)
        try container.encode(self.pickType.type.rawValue, forKey: .pickType)
        if let allowedSummonerIds = self.allowedSummonerIds {
            try container.encode(allowedSummonerIds.map { $0.value }, forKey: .allowedSummonerIds)
        }
        try container.encode(self.mapType.type.rawValue, forKey: .mapType)
        if let metadata = self.metadata {
            try container.encode(metadata, forKey: .metadata)
        }
    }
}
