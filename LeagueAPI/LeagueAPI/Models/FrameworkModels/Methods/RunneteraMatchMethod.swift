//
//  RunneteraMatchMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 1/11/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

internal class RunneteraMatchMethod: LeagueMethod {
    
    public enum RunneteraMatchMethods {
        case IdsByPuuid(id: SummonerPuuid)
        case byMatchId(matchId: RunneteraMatchId)
    }
    
    private var service: ServiceProxy
    private var method: RunneteraMatchMethods
    
    public init(method: RunneteraMatchMethods, region: WorldRegion) {
        self.method = method
        self.service = ServiceProxy(for: region)
    }
    
    public func getAccessMethod() -> RESTRequester.AccessMethod {
        return .GET
    }
    
    public func getMethodSignature() -> String {
        return "Default"
    }
    
    public func getMethodUrl() -> String {
        let entrypoint: String = self.service.worldRegionHostUrl
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.RunneteraMatch.rawValue)/\(Version.RUNNETERA_API)/matches"
        switch self.method {
        case .IdsByPuuid(let puuid):
            return "\(commonPath)/by-puuid/\(puuid)/ids"
        case .byMatchId(let matchId):
            return "\(commonPath)/\(matchId)"
        }
    }
    
    func getMethodBody() -> Data? {
        return nil
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
