//
//  TFTTraitInfoBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/25/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

internal class TFTTraitInfoBusiness {
    
    public static func getTraitInfos(byId id: TFTTraitId) -> TFTTraitInfo? {
        let tftTraitInfos = TFTTraitInfoBusiness.getTraitInfos()
        return tftTraitInfos?.first{ $0.id == id }
    }
    
    public static func getTraitInfos(byName name: String) -> TFTTraitInfo? {
        let tftTraitInfos = TFTTraitInfoBusiness.getTraitInfos()
        return tftTraitInfos?.first{ $0.name.lowercased() == name.lowercased() }
    }
    
    public static func getAllTraitInfos() -> [TFTTraitInfo] {
        return TFTTraitInfoBusiness.getTraitInfos() ?? []
    }
    
    private static func getTraitInfos() -> [TFTTraitInfo]? {
        guard let traitsData = LocalAssets.getAssetData(filename: "traits.json") else { return nil }
        let (tftTraitInfos, _) = ObjectMapper.convert(traitsData, into: [TFTTraitInfo].self)
        return tftTraitInfos
    }
}
