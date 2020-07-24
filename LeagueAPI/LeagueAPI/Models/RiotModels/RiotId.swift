//
//  RiotId.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/20/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public class RiotId: Decodable {
    
    public var gameName: String
    public var tagLine: String
    
    enum CodingKeys: String, CodingKey {
        case gameName = "gameName"
        case tagLine = "tagLine"
    }
    
    public init(gameName: String, tagLine: String) {
        self.gameName = gameName
        self.tagLine = tagLine
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.gameName = try container.decode(String.self, forKey: .gameName)
        self.tagLine = try container.decode(String.self, forKey: .tagLine)
    }
}
