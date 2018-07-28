//
//  ChampionMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ChampionMethod: LeagueMethod {
    
    public enum ChampionMethods {
        case All(freeToPlay: Bool)
        case ById(id: Double)
    }
    
    private var service: ServiceProxy
    private var method: ChampionMethods
    
    public init(method: ChampionMethods, region: Region) {
        self.method = method
        self.service = ServiceProxy(for: region)
    }
    
    func getAccessMethod() -> RESTRequester.AccessMethod {
        return .GET
    }
    
    func getMethodSignature() -> String {
        return "Champion"
    }
    
    func getMethodUrl() -> String {
        let entrypoint: String = self.service.host
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.Platform.rawValue)/\(Version.RiotAPI)/champions"
        switch self.method {
        case .All(let freeToPlay):
            return "\(commonPath)?freeToPlay=\(freeToPlay)"
        case .ById(let id):
            return "\(commonPath)/\(id)"
        }
    }
}
