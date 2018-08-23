//
//  LeagueAPI.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class LeagueAPI: APIClient {
    
    public private(set) var riotAPI: RiotAPI
    
    public override init(APIToken: String) {
        self.riotAPI = RiotAPI(APIToken: APIToken)
        super.init(APIToken: APIToken)
    }
    
    public func clearCache() {
        DataDragonRequester.clearCache()
    }
    
    // MARK: - Service
    
    public func getPatchVersion(handler: @escaping (String?, String?) -> Void) {
        DataDragonVersionBusiness.getPatchVersion(completion: handler)
    }
    
    // MARK: - Champion
    
    public func getChampionDetails(by championId: ChampionId, handler: @escaping (ChampionDetails?, String?) -> Void) {
        DataDragonChampionBusiness.getChampionDetails(by: championId, completion: handler)
    }
    
    public func getChampionDetails(byName name: String, handler: @escaping (ChampionDetails?, String?) -> Void) {
        DataDragonChampionBusiness.getChampionDetails(byName: name, completion: handler)
    }
    
    public func getAllChampionIds(handler: @escaping ([ChampionId]?, String?) -> Void) {
        DataDragonChampionBusiness.getAllChampionIds(completion: handler)
    }
    
    public func getAllChampionNames(handler: @escaping ([String]?, String?) -> Void) {
        DataDragonChampionBusiness.getAllChampionNames(completion: handler)
    }
    
    public func getChampionNames(for role: ChampionRole, handler: @escaping ([String]?, String?) -> Void) {
        DataDragonChampionBusiness.getChampions(for: role, completion: handler)
    }
    
    // MARK: - Profile Icon
    
    public func getProfileIconIds(handler: @escaping ([ProfileIconId]?, String?) -> Void) {
        DataDragonProfileIconBusiness.getProfileIconIds(completion: handler)
    }
    
    public func getProfileIcon(by id: ProfileIconId, handler: @escaping (ProfileIcon?, String?) -> Void) {
        DataDragonProfileIconBusiness.getProfileIcon(byId: id, completion: handler)
    }
    
    // MARK: - Summoner Spell
    
    public func getSummonerSpells(handler: @escaping ([SummonerSpell]?, String?) -> Void) {
        DataDragonSummonerSpellBusiness.getSummonerSpells(completion: handler)
    }
    
    public func getSummonerSpell(by id: SummonerSpellId, handler: @escaping (SummonerSpell?, String?) -> Void) {
        DataDragonSummonerSpellBusiness.getSummonerSpell(by: id, completion: handler)
    }
}
