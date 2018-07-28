//
//  Observer.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Observer: Decodable {
    
    public var encryptionKey: String
    
    enum CodingKeys: String, CodingKey {
        case encryptionKey = "encryptionKey"
    }
    
    public init(encryptionKey: String) {
        self.encryptionKey = encryptionKey
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.encryptionKey = try container.decode(String.self, forKey: .encryptionKey)
    }
}
