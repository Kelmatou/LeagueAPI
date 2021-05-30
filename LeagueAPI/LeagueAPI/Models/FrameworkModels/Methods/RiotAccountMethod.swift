//
//  RiotAccountMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/20/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

internal class RiotAccountMethod: LeagueMethod {
    
    public enum RiotAccountMethods: CustomStringConvertible {
        case ByPuuid(puuid: SummonerPuuid)
        case ByRiotId(riotId: RiotId)
        case ActiveShardsByGame(puuid: SummonerPuuid, game: ShardGame)
        case ByAuthorizationToken(token: String)
        
        public var description: String {
            var methodDescription: String {
                switch self {
                case .ByPuuid:
                    return "ByPuuid"
                case .ByRiotId:
                    return "ByRiotId"
                case .ActiveShardsByGame:
                    return "ActiveShardsByGame"
                case .ByAuthorizationToken:
                    return "ByAuthorizationToken"
                }
            }
            return "\(String(describing: RiotAccountMethods.self))-\(methodDescription)"
        }
    }
    
    private var service: ServiceProxy
    private var method: RiotAccountMethods
    
    public init(method: RiotAccountMethods, region: WorldRegion) {
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
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.RiotAccount.rawValue)/\(Version.RIOT_API)"
        switch self.method {
        case .ByPuuid(let puuid):
            return "\(commonPath)/accounts/by-puuid/\(puuid)"
        case .ByRiotId(let riotId):
            return "\(commonPath)/accounts/by-riot-id/\(riotId.gameName)/\(riotId.tagLine)"
        case .ActiveShardsByGame(let puuid, let game):
            return "\(commonPath)/active-shards/by-game/\(game.shardGame.rawValue)/by-puuid/\(puuid)"
        case .ByAuthorizationToken:
            return "\(commonPath)/accounts/me"
        }
    }
    
    func getMethodBody() -> Data? {
        return nil
    }
    
    func getCustomHeaders() -> [String: String] {
        switch self.method {
        case .ByAuthorizationToken(let token):
            return ["Authorization": token]
        default:
            return [:]
        }
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
