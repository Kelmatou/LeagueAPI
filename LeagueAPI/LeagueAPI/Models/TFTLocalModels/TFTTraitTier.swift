//
//  TFTTraitTier.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/25/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public class TFTTraitTier: Decodable {
    
    public enum TFTTraitTierStyle: String {
        case Bronze = "bronze"
        case Silver = "silver"
        case Gold = "gold"
        case Chromatic = "chromatic"
        case None = "none"
        
        static func fromStr(str: String) -> TFTTraitTierStyle {
            switch str {
            case TFTTraitTierStyle.Bronze.rawValue:
                return .Bronze
            case TFTTraitTierStyle.Silver.rawValue:
                return .Silver
            case TFTTraitTierStyle.Gold.rawValue:
                return .Gold
            case TFTTraitTierStyle.Chromatic.rawValue:
                return .Chromatic
            default:
                return .None
            }
        }
    }
    
    public var style: TFTTraitTierStyle
    public var minUnit: Int
    public var maxUnit: Int?
    
    enum CodingKeys: String, CodingKey {
        case style = "style"
        case minUnit = "min"
        case maxUnit = "max"
    }
    
    public init(style: TFTTraitTierStyle, minUnit: Int, maxUnit: Int?) {
        self.style = style
        self.minUnit = minUnit
        self.maxUnit = maxUnit
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.style = try TFTTraitTierStyle.fromStr(str: container.decode(String.self, forKey: .style))
        self.minUnit = try container.decode(Int.self, forKey: .minUnit)
        self.maxUnit = try? container.decode(Int.self, forKey: .maxUnit)
    }
}
