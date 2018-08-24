//
//  DataDragonRequester.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DataDragonRequester {
    
    // MARK: - Singleton
    
    public private(set) static var instance: DataDragonRequester = DataDragonRequester()
    
    private init() {}
    
    // MARK: - Cache
    
    private var versions: DDragonVersions?
    private var championsDetails: DDragonChampionsFile?
    private var championAdditionalDetails: [String : DDragonChampionFile?] = [:]
    private var profileIconFile: DDragonProfileIconsFile?
    private var summonerSpellsFile: DDragonSummonerSpellsFile?
    private var itemsFile: DDragonItemsFile?
    
    // MARK: - Methods
    
    public static func clearCache() {
        DataDragonRequester.instance = DataDragonRequester()
    }
    
    public func getDataVersions(completion: @escaping (DDragonVersions?, String?) -> Void) {
        if let versions = versions {
            completion(versions, nil)
        }
        else {
            let versionUrl: String = "\(ServicesUrl.DDragonUrl)/realms/na.json"
            RESTRequester().requestObject(.GET, url: versionUrl, asType: DDragonVersions.self) { (versions, _, _, error) in
                self.versions = versions
                completion(versions, error)
            }
        }
    }
    
    public func getChampionsDetails(completion: @escaping (DDragonChampionsFile?, String?) -> Void) {
        if let championsDetails = championsDetails {
            completion(championsDetails, nil)
        }
        else {
            getDataVersions() { (versions, error) in
                guard let versions = versions else { completion(nil, error); return }
                let championsUrl: String = "\(ServicesUrl.DDragonCdn)/\(versions.champion)/data/en_US/champion.json"
                RESTRequester().requestObject(.GET, url: championsUrl, asType: DDragonChampionsFile.self) { (championsDetails, _, _, error) in
                    self.championsDetails = championsDetails
                    completion(championsDetails, error)
                }
            }
        }
    }
    
    public func getChampionAdditionalDetails(name: String, completion: @escaping (DDragonChampionFile?, String?) -> Void) {
        if let championDetails = championAdditionalDetails[name.lowercased()] {
            completion(championDetails, nil)
        }
        else {
            getDataVersions() { (versions, error) in
                guard let versions = versions else { completion(nil, error); return }
                let championUrl: String = "\(ServicesUrl.DDragonCdn)/\(versions.champion)/data/en_US/champion/\(name).json"
                RESTRequester().requestObject(.GET, url: championUrl, asType: DDragonChampionFile.self) { (championDetails, _, _, error) in
                    self.championAdditionalDetails[name.lowercased()] = championDetails
                    completion(championDetails, error)
                }
            }
        }
    }
    
    public func getProfileIcons(completion: @escaping (DDragonProfileIconsFile?, String?) -> Void) {
        if let profileIconFile = self.profileIconFile {
            completion(profileIconFile, nil)
        }
        else {
            getDataVersions() { (versions, error) in
                guard let versions = versions else { completion(nil, error); return }
                let profileIconsUrl: String = "\(ServicesUrl.DDragonCdn)/\(versions.profileIcon)/data/en_US/profileicon.json"
                RESTRequester().requestObject(.GET, url: profileIconsUrl, asType: DDragonProfileIconsFile.self) { (profileIconFile, _, _, error) in
                    self.profileIconFile = profileIconFile
                    completion(profileIconFile, error)
                }
            }
        }
    }
    
    public func getSummonerSpells(completion: @escaping (DDragonSummonerSpellsFile?, String?) -> Void) {
        if let summonerSpellsFile = self.summonerSpellsFile {
            completion(summonerSpellsFile, nil)
        }
        else {
            getDataVersions() { (versions, error) in
                guard let versions = versions else { completion(nil, error); return }
                let summonerSpellsUrl: String = "\(ServicesUrl.DDragonCdn)/\(versions.summoner)/data/en_US/summoner.json"
                RESTRequester().requestObject(.GET, url: summonerSpellsUrl, asType: DDragonSummonerSpellsFile.self) { (summonerSpellsFile, _, _, error) in
                    self.summonerSpellsFile = summonerSpellsFile
                    completion(summonerSpellsFile, error)
                }
            }
        }
    }
    
    public func getItems(completion: @escaping (DDragonItemsFile?, String?) -> Void) {
        if let itemsFile = self.itemsFile {
            completion(itemsFile, nil)
        }
        else {
            getDataVersions() { (versions, error) in
                guard let versions = versions else { completion(nil, error); return }
                let itemsUrl: String = "\(ServicesUrl.DDragonCdn)/\(versions.item)/data/en_US/item.json"
                RESTRequester().requestObject(.GET, url: itemsUrl, asType: DDragonItemsFile.self) { (itemsFile, _, _, error) in
                    self.itemsFile = itemsFile
                    completion(itemsFile, error)
                }
            }
        }
    }
}
