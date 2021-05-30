//
//  LoRAPI.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/20/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public class LoRAPI: APIClient {
    
    // MARK: - Deck
    
    public func getDecks(byAuthorizationToken token: String, on region: WorldRegion, handler: @escaping ([RunneteraDeck]?, String?) -> Void) {
        RunneteraDeckBusiness.deckAction(method: .GetDecksByAuthorizationToken(token: token), region: region, key: self.key, handler: handler)
    }
    
    public func createDeck(byAuthorizationToken token: String, withDeckInfo deckInfo: RunneteraDeckCreation, on region: WorldRegion, handler: @escaping (String?, String?) -> Void) {
        RunneteraDeckBusiness.deckAction(method: .CreateDeckByAuthorizationToken(token: token, deckInfo: deckInfo), region: region, key: self.key, handler: handler)
    }
    
    // MARK: - Inventory
    
    public func getInventory(byAuthorizationToken token: String, on region: WorldRegion, handler: @escaping ([RunneteraCard]?, String?) -> Void) {
        RunneteraIventoryBusiness.getInventory(method: .GetByAuthorizationToken(token: token), region: region, key: self.key, handler: handler)
    }
    
    // MARK: - Ranked
    
    public func getMatchIds(by puuid: SummonerPuuid, on region: WorldRegion, handler: @escaping ([String]?, String?) -> Void) {
        RunneteraMatchBusiness.getMatchIds(method: .IdsByPuuid(id: puuid), region: region, key: self.key, handler: handler)
    }

    public func getMatch(by matchId: RunneteraMatchId, on region: WorldRegion, handler: @escaping (RunneteraMatch?, String?) -> Void) {
        RunneteraMatchBusiness.getMatch(method: .byMatchId(matchId: matchId), region: region, key: self.key, handler: handler)
    }
    
    // MARK: - Ranked
    
    public func getLeaderboard(on region: WorldRegion, handler: @escaping ([RunneteraPlayer]?, String?) -> Void) {
        RunneteraRankedBusiness.getLeaderboard(method: .GetLeaderboard, region: region, key: self.key, handler: handler)
    }
    
    // MARK: - Status
    
    public func getStatus(on region: WorldRegion, handler: @escaping (ServiceStatus?, String?) -> Void) {
        RunneteraStatusBusiness.getStatus(method: .GetStatus, region: region, key: self.key, handler: handler)
    }
}
