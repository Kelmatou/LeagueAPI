//
//  SpectatorMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class SpectatorMethod: LeagueMethod {
    
    public enum SpectatorMethods {
        case BySummonerId(id: SummonerId)
        case FeaturedGames
    }
    
    private var service: ServiceProxy
    private var method: SpectatorMethods
    
    public init(method: SpectatorMethods, region: Region) {
        self.method = method
        self.service = ServiceProxy(for: region)
    }
    
    func getAccessMethod() -> RESTRequester.AccessMethod {
        return .GET
    }
    
    func getMethodSignature() -> String {
        return "Default"
    }
    
    func getMethodUrl() -> String {
        let entrypoint: String = self.service.hostUrl
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.Spectator.rawValue)/\(Version.LOL_API)"
        switch self.method {
        case .BySummonerId(let id):
            return "\(commonPath)/active-games/by-summoner/\(id)"
        case .FeaturedGames:
            return "\(commonPath)/featured-games"
        }
    }
    
    func getMethodBody() -> Data? {
        return nil
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
