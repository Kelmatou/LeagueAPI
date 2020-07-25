//
//  TFTGalaxyBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/25/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

internal class TFTGalaxyBusiness {
    
    public static func getGalaxy(byId id: TFTGalaxyId) -> TFTGalaxy? {
        let tftGalaxies = TFTGalaxyBusiness.getGalaxies()
        return tftGalaxies?.first{ $0.id == id }
    }
    
    public static func getGalaxy(byName name: String) -> TFTGalaxy? {
        let tftGalaxies = TFTGalaxyBusiness.getGalaxies()
        return tftGalaxies?.first{ $0.name.lowercased() == name.lowercased() }
    }
    
    public static func getAllGalaxies() -> [TFTGalaxy] {
        return TFTGalaxyBusiness.getGalaxies() ?? []
    }
    
    private static func getGalaxies() -> [TFTGalaxy]? {
        guard let galaxiesData = LocalAssets.getAssetData(filename: "galaxies.json") else { return nil }
        let (tftGalaxies, _) = ObjectMapper.convert(galaxiesData, into: [TFTGalaxy].self)
        return tftGalaxies
    }
}
