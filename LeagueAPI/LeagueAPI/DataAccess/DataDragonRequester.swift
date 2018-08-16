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
    
    public static let instance: DataDragonRequester = DataDragonRequester()
    
    private init() {}
    
    // MARK: - Cache
    
    private var versions: DDragonVersions?
    private var championsDetails: DDragonChampionsFile?
    private var championAdditionalDetails: [String : DDragonChampionFile?] = [:]
    
    // MARK: - DataDragon Urls
    
    private let DataDragonUrl: String = "https://ddragon.leagueoflegends.com"
    
    // MARK: - Methods
    
    public func getDataVersions(completion: @escaping (DDragonVersions?, String?) -> Void) {
        if let versions = versions {
            completion(versions, nil)
        }
        else {
            let versionUrl: String = "\(DataDragonUrl)/realms/na.json"
            RESTRequester.requestObject(.GET, url: versionUrl, asType: DDragonVersions.self) { (versions, _, _, error) in
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
                if let versions = versions {
                    let championsUrl: String = "\(self.DataDragonUrl)/cdn/\(versions.champion)/data/en_US/champion.json"
                    RESTRequester.requestObject(.GET, url: championsUrl, asType: DDragonChampionsFile.self) { (championsDetails, _, _, error) in
                        self.championsDetails = championsDetails
                        completion(championsDetails, error)
                    }
                }
                else {
                    completion(nil, error)
                }
            }
        }
    }
    
    public func getChampionAdditionalDetails(name: String, completion: @escaping (DDragonChampionFile?, String?) -> Void) {
        if let championDetails = championAdditionalDetails[name] {
            completion(championDetails, nil)
        }
        else {
            getDataVersions() { (versions, error) in
                if let versions = versions {
                    let championUrl: String = "\(self.DataDragonUrl)/cdn/\(versions.champion)/data/en_US/champion/\(name).json"
                    RESTRequester.requestObject(.GET, url: championUrl, asType: DDragonChampionFile.self) { (championDetails, _, _, error) in
                        self.championAdditionalDetails[name] = championDetails
                        completion(championDetails, error)
                    }
                }
                else {
                    completion(nil, error)
                }
            }
        }
    }
}
