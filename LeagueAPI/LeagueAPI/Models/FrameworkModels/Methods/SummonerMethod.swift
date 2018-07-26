//
//  SummonerMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class SummonerMethod: LeagueMethod {

    public enum SummonerMethods {
        case ByName(name: String)
        case ById(id: Double)
    }
    
    private var method: SummonerMethods
    
    public init(method: SummonerMethods) {
        self.method = method
    }
    
    public func getMethodSignature() -> String {
        return ""
    }
    
    public func getMethodUrl() -> String {
        return ""
    }
}
