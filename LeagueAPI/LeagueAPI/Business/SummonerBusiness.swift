//
//  SummonerBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class SummonerBusiness {
    
    public enum SummonerMethods {
        case ByName(name: String)
        case ById(id: Double)
    }
    
    public var key: APIKey
    
    public init(key: APIKey) {
        self.key = key
    }
    
    public func executeMethod(method: SummonerMethods) {
        switch method {
        case .ByName(name: ""):
            print()
        case .ById(id: 3):
            print()
        default:
            print()
        }
    }
}
