//
//  RiotAPI.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class RiotAPI: APIClient {

    public func getAccount(byPuuid puuid: SummonerPuuid, on region: WorldRegion, handler: @escaping (RiotAccount?, String?) -> Void) {
        RiotAccountBusiness.getAccountInfo(method: .ByPuuid(puuid: puuid), region: region, key: self.key, handler: handler)
    }
    
    public func getAccount(byRiotId riotId: RiotId, on region: WorldRegion, handler: @escaping (RiotAccount?, String?) -> Void) {
        RiotAccountBusiness.getAccountInfo(method: .ByRiotId(riotId: riotId), region: region, key: self.key, handler: handler)
    }
    
    public func getAccountActiveShards(puuid: SummonerPuuid, game: ShardGame, on region: WorldRegion, handler: @escaping (RiotAccountActiveShard?, String?) -> Void) {
        RiotAccountBusiness.getAccountInfo(method: .ActiveShardsByGame(puuid: puuid, game: game), region: region, key: self.key, handler: handler)
    }
}
