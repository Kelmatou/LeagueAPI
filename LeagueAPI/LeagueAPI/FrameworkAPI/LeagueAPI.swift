//
//  LeagueAPI.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

#if canImport(UIKit)
    import UIKit
#endif

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
        DataDragonProfileIconBusiness.getProfileIcon(by: id, completion: handler)
    }
    
    // MARK: - Summoner Spell
    
    public func getSummonerSpells(handler: @escaping ([SummonerSpell]?, String?) -> Void) {
        DataDragonSummonerSpellBusiness.getSummonerSpells(completion: handler)
    }
    
    public func getSummonerSpell(by id: SummonerSpellId, handler: @escaping (SummonerSpell?, String?) -> Void) {
        DataDragonSummonerSpellBusiness.getSummonerSpell(by: id, completion: handler)
    }
    
    public func getSummonerSpell(byName name: String, handler: @escaping (SummonerSpell?, String?) -> Void) {
        DataDragonSummonerSpellBusiness.getSummonerSpell(byName: name, completion: handler)
    }
    
    // MARK: - Item
    
    public func getItems(handler: @escaping ([Item]?, String?) -> Void) {
        DataDragonItemBusiness.getItems(completion: handler)
    }
    
    public func getItem(by id: ItemId, handler: @escaping (Item?, String?) -> Void) {
        DataDragonItemBusiness.getItem(by: id, completion: handler)
    }
    
    public func getItem(byName name: String, handler: @escaping (Item?, String?) -> Void) {
        DataDragonItemBusiness.getItem(byName: name, completion: handler)
    }
    
    public func getItems(byTag tag: String, handler: @escaping ([Item]?, String?) -> Void) {
        DataDragonItemBusiness.getItems(byTag: tag, completion: handler)
    }
    
    // MARK: - Rune
    
    public func getRunePaths(handler: @escaping ([RunePath]?, String?) -> Void) {
        DataDragonRuneBusiness.getRunePaths(completion: handler)
    }
    
    public func getRunePath(by id: RunePathId, handler: @escaping (RunePath?, String?) -> Void) {
        DataDragonRuneBusiness.getRunePath(by: id, completion: handler)
    }
    
    public func getRunePath(byName name: String, handler: @escaping (RunePath?, String?) -> Void) {
        DataDragonRuneBusiness.getRunePath(byName: name, completion: handler)
    }
    
    public func getRunes(forPathId pathId: RunePathId? = nil, handler: @escaping ([Rune]?, String?) -> Void) {
        DataDragonRuneBusiness.getRunes(forPathId: pathId, completion: handler)
    }
    
    public func getRune(by id: RuneId, handler: @escaping (Rune?, String?) -> Void) {
        DataDragonRuneBusiness.getRune(by: id, completion: handler)
    }
    
    public func getRune(byName name: String, handler: @escaping (Rune?, String?) -> Void) {
        DataDragonRuneBusiness.getRune(byName: name, completion: handler)
    }
    
    // MARK: - Ranked Emblems
    
    public func getEmblem(for tier: RankedTier) -> UIImage? {
        return RankedTierBusiness.getEmblem(for: tier)
    }
}
