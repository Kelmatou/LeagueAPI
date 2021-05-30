//
//  RunneteraDeckCreation.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 5/30/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

public class RunneteraDeckCreation: Encodable {

    public var name: String
    public var code: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case code = "code"
    }
    
    public init(name: String, code: String) {
        self.name = name
        self.code = code
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.code, forKey: .code)
    }
}
