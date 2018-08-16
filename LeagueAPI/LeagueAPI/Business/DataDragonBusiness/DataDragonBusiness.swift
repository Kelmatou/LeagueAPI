//
//  DataDragonBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DataDragonBusiness {
    
    public static func getPatchVersion(completion: @escaping (String?, String?) -> Void) {
        DataDragonRequester.instance.getDataVersions() { (versions, error) in
            completion(versions?.patch, error)
        }
    }
    
    public static func getChampionDetails(by championId: ChampionId, completion: @escaping (ChampionDetails?, String?) -> Void) {
        let filterFunction: ((String, ChampionsDetails)) -> Bool = { (keyValue) -> Bool in
            let (_, value) = keyValue
            return value.championId == championId
        }
        let filterEqualValue: String = "id=\(championId)"
        getChampionDetails(filterFunction: filterFunction, filterEqualValue: filterEqualValue, completion: completion)
    }
    
    public static func getChampionDetails(by name: String, completion: @escaping (ChampionDetails?, String?) -> Void) {
        let filterFunction: ((String, ChampionsDetails)) -> Bool = { (keyValue) -> Bool in
            let (_, value) = keyValue
            return value.name == name
        }
        let filterEqualValue: String = "name=\(name)"
        getChampionDetails(filterFunction: filterFunction, filterEqualValue: filterEqualValue, completion: completion)
    }
    
    private static func getChampionDetails(filterFunction: @escaping ((String, ChampionsDetails)) -> Bool, filterEqualValue: String = "", completion: @escaping (ChampionDetails?, String?) -> Void) {
        DataDragonRequester.instance.getChampionsDetails() { (champions, error) in
            if let champions = champions {
                let championWithFilter: ChampionsDetails? = champions.champions.filter(filterFunction).first?.value
                if let championWithFilter = championWithFilter {
                    let championIdName: String = championWithFilter.championIdName
                    DataDragonRequester.instance.getChampionAdditionalDetails(name: championIdName) { (champion, error) in
                        if let champion = champion {
                            if let championAdditionalDetails = champion.champion[championIdName] {
                                let championDetails: ChampionDetails = ChampionDetails(details: championWithFilter, additionalDetails: championAdditionalDetails)
                                completion(championDetails, nil)
                            }
                            else {
                                completion(nil, "Champion \(filterEqualValue == "" ? "" : "with \(filterEqualValue) ")is \(championWithFilter.name), but additional details was not found.")
                            }
                        }
                        else {
                            completion(nil, error)
                        }
                    }
                }
                else {
                    completion(nil, "Champion \(filterEqualValue == "" ? "" : "with \(filterEqualValue) ")not found.")
                }
            }
            else {
                completion(nil, error)
            }
        }
    }
}
