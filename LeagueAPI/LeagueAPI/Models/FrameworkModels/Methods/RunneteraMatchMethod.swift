//
//  RunneteraMatchMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 1/11/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

internal class RunneteraMatchMethod: LeagueMethod {
    
    public enum RunneteraMatchMethods: CustomStringConvertible {
        case IdsByPuuid(id: SummonerPuuid)
        case byMatchId(matchId: RunneteraMatchId)
        
        public var description: String {
            var methodDescription: String {
                switch self {
                case .IdsByPuuid:
                    return "IdsByPuuid"
                case .byMatchId:
                    return "byMatchId"
                }
            }
            return "\(String(describing: RunneteraMatchMethods.self))-\(methodDescription)"
        }
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
        return self.method.description
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
    
    func getCustomHeaders() -> [String: String] {
        return [:]
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
