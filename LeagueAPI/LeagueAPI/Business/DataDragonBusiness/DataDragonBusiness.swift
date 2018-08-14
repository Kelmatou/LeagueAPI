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
        DataDragonRequester.instance.getChampionsDetails() { (champions, error) in
            if let champions = champions {
                let championById: ChampionsDetails? = champions.champions.filter { $0.value.championId == championId }.first?.value
                if let championById = championById {
                    let championName: String = championById.name
                    DataDragonRequester.instance.getChampionAdditionalDetails(name: championName) { (champion, error) in
                        if let champion = champion {
                            if let championAdditionalDetails = champion.champion[championName] {
                                let championDetails: ChampionDetails = ChampionDetails(details: championById, additionalDetails: championAdditionalDetails)
                                completion(championDetails, nil)
                            }
                            else {
                                completion(nil, "Champion with id=\(championId) is \(championName), but additional details was not found.")
                            }
                        }
                        else {
                            completion(nil, error)
                        }
                    }
                }
                else {
                    completion(nil, "Champion with id=\(championId) not found.")
                }
            }
            else {
                completion(nil, error)
            }
        }
    }
}
