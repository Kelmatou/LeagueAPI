//
//  TournamentInfo.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/29/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class TournamentInfo: Encodable {
    
    public var spectatorType: String
    public var teamSize: Int
    public var pickType: String
    public var allowedSummonerIds: [Int64]
    public var mapType: String
    public var metadata: String
    
    public init(spectatorType: String, teamSize: Int, pickType: String, allowedSummonerIds: [Int64], mapType: String, metadata: String) {
        self.spectatorType = spectatorType
        self.teamSize = teamSize
        self.pickType = pickType
        self.allowedSummonerIds = allowedSummonerIds
        self.mapType = mapType
        self.metadata = metadata
    }
}
