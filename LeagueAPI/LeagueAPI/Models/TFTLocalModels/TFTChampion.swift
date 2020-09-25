//
//  TFTChampion.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/25/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public class TFTChampion: Decodable {
    
    public var id: TFTChampionId
    public var name: String
    public var cost: Int
    public var traitNames: [String]
    
    public var icon: LAPIImage {
        let noSpaceName: String = self.name.replacingOccurrences(of: " ", with: "")
        let capitalizedName: String = "\(noSpaceName.prefix(1).uppercased())\(noSpaceName.dropFirst())"
        let iconFileName: String = "TFT4_\(capitalizedName).png"
        let iconData = LocalAssets.getAssetData(filename: iconFileName)!
        return LAPIImage(data: iconData)!
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "championId"
        case name = "name"
        case cost = "cost"
        case traits = "traits"
    }
    
    public init(id: TFTChampionId, name: String, cost: Int, traitNames: [String]) {
        self.id = id
        self.name = name
        self.cost = cost
        self.traitNames = traitNames
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try TFTChampionId(container.decode(String.self, forKey: .id))
        self.name = try container.decode(String.self, forKey: .name)
        self.cost = try container.decode(Int.self, forKey: .cost)
        self.traitNames = try container.decode([String].self, forKey: .traits)
    }
}
