//
//  DataDragonRuneBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/25/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DataDragonRuneBusiness {
    
    public static func getRunePaths(completion: @escaping ([RunePath]?, String?) -> Void) {
        DataDragonRequester.instance.getRunePaths() { (runePaths, error) in
            completion(runePaths, error)
        }
    }
    
    public static func getRunePath(by id: RunePathId, completion: @escaping (RunePath?, String?) -> Void) {
        getRunePaths() { (runePaths, error) in
            if let runePaths = runePaths {
                runePaths.firstMatch(where: { $0.id == id }, notFoundMessage: "Rune path with id=\(id) not found.", completion: completion)
            }
            else {
                completion(nil, error)
            }
        }
    }
    
    public static func getRunePath(byName name: String, completion: @escaping (RunePath?, String?) -> Void) {
        getRunePaths() { (runePaths, error) in
            if let runePaths = runePaths {
                runePaths.firstMatch(where: { $0.name.equals(name) || $0.nameId.equals(name) }, notFoundMessage: "Rune path with name=\(name) not found.", completion: completion)
            }
            else {
                completion(nil, error)
            }
        }
    }
    
    public static func getRunes(forPathId pathId: RunePathId? = nil, completion: @escaping ([Rune]?, String?) -> Void) {
        getRunePaths() { (runePaths, error) in
            if let runePaths = runePaths?.filter({ pathId == nil ? true : $0.id == pathId }) {
                var runes: [Rune] = []
                for runePath in runePaths {
                    for runeStage in runePath.runeStages {
                        runes.append(runeStage.runes)
                    }
                }
                completion(runes, nil)
            }
            else {
                completion(nil, error)
            }
        }
    }
    
    public static func getRune(by id: RuneId, completion: @escaping (Rune?, String?) -> Void) {
        getRunes() { (runes, error) in
            if let runes = runes {
                runes.firstMatch(where: { $0.id == id }, notFoundMessage: "Rune with id=\(id) not found.", completion: completion)
            }
            else {
                completion(nil, error)
            }
        }
    }
    
    public static func getRune(byName name: String, completion: @escaping (Rune?, String?) -> Void) {
        getRunes() { (runes, error) in
            if let runes = runes {
                runes.firstMatch(where: { $0.name.equals(name) || $0.nameId.equals(name) }, notFoundMessage: "Rune with name=\(name) not found.", completion: completion)
            }
            else {
                completion(nil, error)
            }
        }
    }
}
