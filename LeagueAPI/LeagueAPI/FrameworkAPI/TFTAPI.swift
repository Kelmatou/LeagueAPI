//
//  TFTAPI.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/20/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public class TFTAPI: APIClient {
    
    // MARK: - RANKED
    
    public func getChallengerLeague(on region: Region, handler: @escaping (League?, String?) -> Void) {
        TFTRankedBusiness.getRanked(method: .GetChallenger, region: region, key: self.key, handler: handler)
    }
    
    public func getGrandMasterLeague(on region: Region, handler: @escaping (League?, String?) -> Void) {
        TFTRankedBusiness.getRanked(method: .GetGrandMaster, region: region, key: self.key, handler: handler)
    }
    
    public func getLeague(by leagueId: TFTLeagueId, on region: Region, handler: @escaping (League?, String?) -> Void) {
        TFTRankedBusiness.getRanked(method: .LeagueById(id: leagueId), region: region, key: self.key, handler: handler)
    }
    
    public func getMasterLeague(on region: Region, handler: @escaping (League?, String?) -> Void) {
        TFTRankedBusiness.getRanked(method:.GetMaster, region: region, key: self.key, handler: handler)
    }
    
    public func getRankedEntries(for summonerId: SummonerId, on region: Region, handler: @escaping ([RankedEntry]?, String?) -> Void) {
        TFTRankedBusiness.getRanked(method: .EntriesById(id: summonerId), region: region, key: self.key, handler: handler)
    }
    
    public func getEntries(on region: Region, division: RankedDivision, page: Int = 1, handler: @escaping ([RankedEntry]?, String?) -> Void) {
        TFTRankedBusiness.getRanked(method: .EntriesByTierAndDivision(division: division, page: page), region: region, key: self.key, handler: handler)
    }
    
    // MARK: - Match
    
    public func getMatchList(by puuid: SummonerPuuid, on region: Region, handler: @escaping ([TFTGameId]?, String?) -> Void) {
        let middleHandler: ([String]?, String?) -> Void = { (TFTgameIds, errorMsg) in
            if let TFTgameIds = TFTgameIds {
                handler(TFTgameIds.map({ TFTGameId($0) }), errorMsg)
            } else {
                handler(nil, errorMsg)
            }
        }
        TFTMatchBusiness.getMatch(method: .byPuuid(puuid: puuid), region: region, key: self.key, handler: middleHandler)
    }
    
    public func getMatch(by gameId: TFTGameId, on region: Region, handler: @escaping (TFTMatch?, String?) -> Void) {
        TFTMatchBusiness.getMatch(method: .ById(id: gameId), region: region, key: self.key, handler: handler)
    }
    
    // MARK: - Summoner
    
    public func getSummoner(by accountId: AccountId, on region: Region, handler: @escaping (Summoner?, String?) -> Void) {
        TFTSummonerBusiness.getSummoner(method: .ByAccountId(id: accountId), region: region, key: self.key, handler: handler)
    }
    
    public func getSummoner(byName name: String, on region: Region, handler: @escaping (Summoner?, String?) -> Void) {
        TFTSummonerBusiness.getSummoner(method: .ByName(name: name), region: region, key: self.key, handler: handler)
    }
    
    public func getSummoner(by puuid: SummonerPuuid, on region: Region, handler: @escaping (Summoner?, String?) -> Void) {
        TFTSummonerBusiness.getSummoner(method: .byPuuid(puuid: puuid), region: region, key: self.key, handler: handler)
    }
    
    public func getSummoner(by summonerId: SummonerId, on region: Region, handler: @escaping (Summoner?, String?) -> Void) {
        TFTSummonerBusiness.getSummoner(method: .ById(id: summonerId), region: region, key: self.key, handler: handler)
    }
}
