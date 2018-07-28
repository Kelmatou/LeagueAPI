//
//  LeagueAPI.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class LeagueAPI {
    
    private var key: APIKey
    
    public init(APIToken: String) {
        self.key = APIKey(token: APIToken)
    }
    
    // MARK: - Champion Mastery
    
    public func getChampionMasteries(by summonerId: Double, on region: Region, handler: @escaping ([ChampionMastery]?, String?) -> Void) {
        ChampionMasteryBusiness.getMastery(method: .BySummonerId(id: summonerId), region: region, key: self.key) { (championMasteries, error) in
            handler(championMasteries, error)
        }
    }
    
    public func getChampionMastery(by summonerId: Double, for championId: Double, on region: Region, handler: @escaping (ChampionMastery?, String?) -> Void) {
        ChampionMasteryBusiness.getMastery(method: .BySummonerIdAndChampionId(summonerId: summonerId, championId: championId), region: region, key: self.key) { (championMastery, error) in
            handler(championMastery, error)
        }
    }
    
    public func getMasteryScore(for summonerId: Double, on region: Region, handler: @escaping (Int?, String?) -> Void) {
        ChampionMasteryBusiness.getMastery(method: .ScoreBySummonerId(id: summonerId), region: region, key: self.key) { (masteryScore, error) in
            handler(masteryScore, error)
        }
    }
    
    // MARK: - Champion
    
    public func getAll(freeToPlayOnly: Bool = false, on region: Region, handler: @escaping ([Champion]?, String?) -> Void) {
        ChampionBusiness.getChampionList(method: .All(freeToPlay: freeToPlayOnly), region: region, key: self.key) { (champions, error) in
            handler(champions, error)
        }
    }
    
    public func getChampion(by championId: Double, on region: Region, handler: @escaping (Champion?, String?) -> Void) {
        ChampionBusiness.getChampion(method: .ById(id: championId), region: region, key: self.key) { (champion, error) in
            handler(champion, error)
        }
    }
    
    // MARK: - Summoner
    
    public func getSummonerByAccountId(accountId: Double, on region: Region, handler: @escaping (Summoner?, String?) -> Void) {
        SummonerBusiness.getSummoner(method: .ByAccountId(id: accountId), region: region, key: self.key) { (summoner, error) in
            handler(summoner, error)
        }
    }
    
    public func getSummoner(by name: String, on region: Region, handler: @escaping (Summoner?, String?) -> Void) {
        SummonerBusiness.getSummoner(method: .ByName(name: name), region: region, key: self.key) { (summoner, error) in
            handler(summoner, error)
        }
    }
    
    public func getSummoner(by summonerId: Double, on region: Region, handler: @escaping (Summoner?, String?) -> Void) {
        SummonerBusiness.getSummoner(method: .ById(id: summonerId), region: region, key: self.key) { (summoner, error) in
            handler(summoner, error)
        }
    }
}
