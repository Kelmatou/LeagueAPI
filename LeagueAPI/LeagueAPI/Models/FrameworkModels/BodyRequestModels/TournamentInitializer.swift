//
//  TournamentInitializer.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/29/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class TournamentInitializer: Encodable {
    
    public var name: String = ""
    public var providerId: ProviderId
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case providerId = "providerId"
    }
    
    public init(name: String, providerId: ProviderId) {
        self.name = name
        self.providerId = providerId
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.providerId.value, forKey: .providerId)
    }
}
