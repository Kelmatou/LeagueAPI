//
//  TFTItem.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/25/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

#if canImport(UIKit)
    import UIKit
#endif

public class TFTItem: Decodable {
    
    public var id: TFTItemId
    public var name: String
    public var description: String
    
    public var icon: LAPIImage {
        let iconFileName: String = "\(self.id.value < 10 ? "0" : "")\(self.id).png"
        let iconData = LocalAssets.getAssetData(filename: iconFileName)!
        return LAPIImage(data: iconData)!
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
    }
    
    public init(id: TFTItemId, name: String, description: String) {
        self.id = id
        self.name = name
        self.description = description
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try TFTItemId(container.decode(Int.self, forKey: .id))
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
    }
}
