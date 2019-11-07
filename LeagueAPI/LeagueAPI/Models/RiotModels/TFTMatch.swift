//
//  TFTMatch.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/6/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

public class TFTMatch: Decodable {
    
    public var info: TFTMatchInfo
    public var metadata: TFTMatchMetadata
    
    enum CodingKeys: String, CodingKey {
        case info = "info"
        case metadata = "metadata"
    }
    
    public init(info: TFTMatchInfo, metadata: TFTMatchMetadata) {
        self.info = info
        self.metadata = metadata
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.info = try container.decode(TFTMatchInfo.self, forKey: .info)
        self.metadata = try container.decode(TFTMatchMetadata.self, forKey: .metadata)
    }
}
