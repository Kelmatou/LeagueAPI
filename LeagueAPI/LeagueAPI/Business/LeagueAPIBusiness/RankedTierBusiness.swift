//
//  RankedTierBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 12/23/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

#if canImport(UIKit)
    import UIKit
#endif

internal class RankedTierBusiness {
    
    public static func getEmblem(for tier: RankedTier) -> UIImage? {
        var tierEmblemFile: String? {
            switch tier.tier {
            case .Iron:
                return "Iron_Emblem.png"
            case .Silver:
                return "Silver_Emblem.png"
            case .Gold:
                return "Gold_Emblem.png"
            case .Platinum:
                return "Platinum_Emblem.png"
            case .Diamond:
                return "Diamond_Emblem.png"
            case .Master:
                return "Master_Emblem.png"
            case .GrandMaster:
                return "Grandmaster_Emblem.png"
            case .Challenger:
                return "Challenger_Emblem.png"
            default:
                return nil
            }
        }
        guard let tierEmblemFileUnwrapped = tierEmblemFile else { return nil }
        guard let tierEmblemData = LocalAssets.getAssetData(filename: tierEmblemFileUnwrapped) else { return nil }
        return UIImage(data: tierEmblemData)
    }
}
