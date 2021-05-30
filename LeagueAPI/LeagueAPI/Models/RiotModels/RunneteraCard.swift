//
//  RunneteraCard.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 5/30/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

public class RunneteraCard: Decodable {
    
    public var code: String
    public var count: String // may be a number but we have to way to test this with an endpoint
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case count = "count"
    }
    
    public init(code: String, count: String) {
        self.code = code
        self.count = count
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(String.self, forKey: .code)
        self.count = try container.decode(String.self, forKey: .count)
    }
}
