//
//  RunneteraMatch.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 1/15/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

public class RunneteraMatch: Decodable {
    
    public var metadata: MatchMetadata<RunneteraMatchId>
    public var info: RunneteraMatchInfo
    
    enum CodingKeys: String, CodingKey {
        case metadata = "metadata"
        case info = "info"
    }
    
    public init(metadata: MatchMetadata<RunneteraMatchId>, info: RunneteraMatchInfo) {
        self.metadata = metadata
        self.info = info
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.metadata = try container.decode(MatchMetadata<RunneteraMatchId>.self, forKey: .metadata)
        self.info = try container.decode(RunneteraMatchInfo.self, forKey: .info)
    }
}
