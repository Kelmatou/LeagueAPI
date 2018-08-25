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
    
    private let AcceptCharsetUtf8: [String : String] = ["Accept-Charset" : "utf-8"]
    
    // MARK: - Cache
    
    private var versions: DDragonVersions?
    private var championsDetails: DDragonChampionsFile?
    private var championAdditionalDetails: [String : DDragonChampionFile?] = [:]
    private var profileIconFile: DDragonProfileIconsFile?
    private var summonerSpellsFile: DDragonSummonerSpellsFile?
    private var itemsFile: DDragonItemsFile?
    private var runePaths: [RunePath]?
    
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
            RESTRequester().requestObject(.GET, url: versionUrl, headers: AcceptCharsetUtf8, asType: DDragonVersions.self) { (versions, _, _, error) in
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
                RESTRequester().requestObject(.GET, url: championsUrl, headers: self.AcceptCharsetUtf8, asType: DDragonChampionsFile.self) { (championsDetails, _, _, error) in
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
                RESTRequester().requestObject(.GET, url: championUrl, headers: self.AcceptCharsetUtf8, asType: DDragonChampionFile.self) { (championDetails, _, _, error) in
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
                RESTRequester().requestObject(.GET, url: profileIconsUrl, headers: self.AcceptCharsetUtf8, asType: DDragonProfileIconsFile.self) { (profileIconFile, _, _, error) in
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
                RESTRequester().requestObject(.GET, url: summonerSpellsUrl, headers: self.AcceptCharsetUtf8, asType: DDragonSummonerSpellsFile.self) { (summonerSpellsFile, _, _, error) in
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
                RESTRequester().requestObject(.GET, url: itemsUrl, headers: self.AcceptCharsetUtf8, asType: DDragonItemsFile.self) { (itemsFile, _, _, error) in
                    self.itemsFile = itemsFile
                    completion(itemsFile, error)
                }
            }
        }
    }
    
    public func getRunePaths(completion: @escaping ([RunePath]?, String?) -> Void) {
        if let runePaths = self.runePaths {
            completion(runePaths, nil)
        }
        else {
            getDataVersions() { (versions, error) in
                guard let versions = versions else { completion(nil, error); return }
                // Riot does not expose rune reforged version so we take language which is usually the last version
                let runePathsUrl: String = "\(ServicesUrl.DDragonCdn)/\(versions.language)/data/en_US/runesReforged.json"
                RESTRequester().requestObject(.GET, url: runePathsUrl, headers: self.AcceptCharsetUtf8, asType: [RunePath].self) { (runePaths, _, _, error) in
                    self.runePaths = runePaths
                    completion(runePaths, error)
                }
            }
        }
    }
}
