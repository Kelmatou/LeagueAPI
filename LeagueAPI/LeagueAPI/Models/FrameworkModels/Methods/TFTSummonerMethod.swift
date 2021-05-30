//
//  TFTSummonerMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/6/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

internal class TFTSummonerMethod: LeagueMethod {
    
    public enum TFTSummonerMethods: CustomStringConvertible {
        case ByAccountId(id: AccountId)
        case ByName(name: String)
        case byPuuid(puuid: SummonerPuuid)
        case ById(id: SummonerId)
        case ByAuthorizationToken(token: String)
        
        public var description: String {
            var methodDescription: String {
                switch self {
                case .ByAccountId:
                    return "ByAccountId"
                case .ByName:
                    return "ByName"
                case .byPuuid:
                    return "byPuuid"
                case .ById:
                    return "ById"
                case .ByAuthorizationToken:
                    return "ByAuthorizationToken"
                }
            }
            return "\(String(describing: TFTSummonerMethods.self))-\(methodDescription)"
        }
    }
    
    private var service: ServiceProxy
    private var method: TFTSummonerMethods
    
    public init(method: TFTSummonerMethods, region: Region) {
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
        let entrypoint: String = self.service.hostUrl
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.TFTSummoner.rawValue)/\(Version.TFT_API)/summoners"
        switch self.method {
        case .ByAccountId(let id):
            return "\(commonPath)/by-account/\(id)"
        case .ByName(let name):
            return "\(commonPath)/by-name/\(name)"
        case .byPuuid(let puuid):
            return "\(commonPath)/by-puuid/\(puuid)"
        case .ById(let id):
            return "\(commonPath)/\(id)"
        case .ByAuthorizationToken:
            return "\(commonPath)/me"
        }
    }
    
    func getMethodBody() -> Data? {
        return nil
    }
    
    func getCustomHeaders() -> [String: String] {
        switch self.method {
        case .ByAuthorizationToken(let token):
            return ["Authorization": token]
        case .ByAccountId, .ByName, .byPuuid, .ById:
            return [:]
        }
    }
    
    func getWarningMessage() -> String? {
        switch self.method {
        case .ByAccountId, .ByName, .byPuuid, .ByAuthorizationToken:
            return nil
        case .ById:
            return "Too many calls to unexisting TFTSummoner(by SummonerId) may result in Blacklist"
        }
    }
}
