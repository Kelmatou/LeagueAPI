//
//  TFTItemsBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/25/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

internal class TFTItemsBusiness {
    
    public static func getItem(byId id: TFTItemId) -> TFTItem? {
        let tftItems = TFTItemsBusiness.getItems()
        return tftItems?.first{ $0.id == id }
    }
    
    public static func getItem(byName name: String) -> TFTItem? {
        let tftItems = TFTItemsBusiness.getItems()
        return tftItems?.first{ $0.name.lowercased() == name.lowercased() }
    }
    
    public static func getAllItems() -> [TFTItem] {
        return TFTItemsBusiness.getItems() ?? []
    }
    
    private static func getItems() -> [TFTItem]? {
        guard let itemsData = LocalAssets.getAssetData(filename: "items.json") else { return nil }
        let (tftItems, _) = ObjectMapper.convert(itemsData, into: [TFTItem].self)
        return tftItems
    }
}
