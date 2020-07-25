//
//  TFTChampionBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/25/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

internal class TFTChampionBusiness {
    
    public static func getChampion(byId id: TFTChampionId) -> TFTChampion? {
        let tftChampions = TFTChampionBusiness.getChampions()
        return tftChampions?.first{ $0.id == id }
    }
    
    public static func getChampion(byName name: String) -> TFTChampion? {
        let tftChampions = TFTChampionBusiness.getChampions()
        return tftChampions?.first{ $0.name.lowercased() == name.lowercased() }
    }
    
    public static func getChampions(byCost cost: Int) -> [TFTChampion]? {
        let tftChampions = TFTChampionBusiness.getChampions()
        return tftChampions?.filter{ $0.cost == cost }
    }
    
    public static func getChampions(withTrait trait: String) -> [TFTChampion]? {
        let tftChampions = TFTChampionBusiness.getChampions()
        return tftChampions?.filter{ $0.traitNames.contains(trait) }
    }
    
    public static func getAllChampions() -> [TFTChampion] {
        return TFTChampionBusiness.getChampions() ?? []
    }
    
    private static func getChampions() -> [TFTChampion]? {
        guard let championsData = LocalAssets.getAssetData(filename: "champions.json") else { return nil }
        let (tftChampions, _) = ObjectMapper.convert(championsData, into: [TFTChampion].self)
        return tftChampions
    }
}
