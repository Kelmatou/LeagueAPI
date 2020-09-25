//
//  TFTTraitInfo.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/25/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

#if canImport(UIKit)
    import UIKit
#endif

public class TFTTraitInfo: Decodable {
    
    public var id: TFTTraitId
    public var name: String
    public var description: String
    public var type: String
    public var sets: [TFTTraitTier]
    
    public var icon: LAPIImage {
        let iconFileName: String = "\(self.name.replacingOccurrences(of: " ", with: "").lowercased()).png"
        let iconData = LocalAssets.getAssetData(filename: iconFileName)!
        return LAPIImage(data: iconData)!
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "key"
        case name = "name"
        case description = "description"
        case innate = "innate"
        case type = "type"
        case sets = "sets"
    }
    
    public init(id: TFTTraitId, name: String, description: String, type: String, sets: [TFTTraitTier]) {
        self.id = id
        self.name = name
        self.description = description
        self.type = type
        self.sets = sets
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try TFTTraitId(container.decode(String.self, forKey: .id))
        self.name = try container.decode(String.self, forKey: .name)
        if let description = try? container.decode(String.self, forKey: .description) {
            self.description = description
        } else if let innate = try? container.decode(String.self, forKey: .innate) {
            self.description = innate
        } else {
            self.description = ""
        }
        self.type = try container.decode(String.self, forKey: .type)
        self.sets = try container.decode([TFTTraitTier].self, forKey: .sets)
    }
}
