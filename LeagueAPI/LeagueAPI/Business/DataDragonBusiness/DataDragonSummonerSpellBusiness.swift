//
//  DataDragonSummonerSpellBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/23/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DataDragonSummonerSpellBusiness {
    
    public static func getSummonerSpells(completion: @escaping ([SummonerSpell]?, String?) -> Void) {
        DataDragonRequester.instance.getSummonerSpells() { (summonerSpellFile, error) in
            completion(summonerSpellFile?.summonerSpells, error)
        }
    }
    
    public static func getSummonerSpell(by id: SummonerSpellId, completion: @escaping (SummonerSpell?, String?) -> Void) {
        getSummonerSpells() { (summonerSpells, error) in
            if let summonerSpells = summonerSpells {
                summonerSpells.firstMatch(where: { $0.id == id }, notFoundMessage: "Summoner spell with id=\(id) not found.", completion: completion)
            }
            else {
                completion(nil, error)
            }
        }
    }
    
    public static func getSummonerSpell(byName name: String, completion: @escaping (SummonerSpell?, String?) -> Void) {
        getSummonerSpells() { (summonerSpells, error) in
            if let summonerSpells = summonerSpells {
                summonerSpells.firstMatch(where: { $0.name.equals(name) || $0.nameId.equals(name) }, notFoundMessage: "Summoner spell with name=\(name) not found.", completion: completion)
            }
            else {
                completion(nil, error)
            }
        }
    }
}
