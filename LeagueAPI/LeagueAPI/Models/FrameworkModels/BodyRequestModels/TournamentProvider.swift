//
//  TournamentProvider.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/29/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class TournamentProvider: Encodable {
    
    public var region: String
    public var url: String
    
    public init(region: String, url: String) {
        self.region = region
        self.url = url
    }
}
