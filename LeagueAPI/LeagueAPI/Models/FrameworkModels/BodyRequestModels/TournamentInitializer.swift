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
    
    public init(name: String, providerId: ProviderId) {
        self.name = name
        self.providerId = providerId
    }
}
