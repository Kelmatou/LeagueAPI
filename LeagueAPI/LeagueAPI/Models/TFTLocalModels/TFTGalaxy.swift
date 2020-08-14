//
//  TFTGalaxy.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/25/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

#if canImport(UIKit)
    import UIKit
#endif

public class TFTGalaxy: Decodable {
    
    public var id: TFTGalaxyId
    public var name: String
    public var description: String
    
    public var icon: LAPIImage {
        let iconFileName: String = "\(self.id).png"
        let iconData = LocalAssets.getAssetData(filename: iconFileName)!
        return LAPIImage(data: iconData)!
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "key"
        case name = "name"
        case description = "description"
    }
    
    public init(id: TFTGalaxyId, name: String, description: String) {
        self.id = id
        self.name = name
        self.description = description
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try TFTGalaxyId(container.decode(String.self, forKey: .id))
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
    }
}
