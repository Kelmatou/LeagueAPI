//
//  TFTSummonerMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/6/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

internal class TFTSummonerMethod: LeagueMethod {
    
    public enum TFTSummonerMethods {
        case ByAccountId(id: AccountId)
        case ByName(name: String)
        case byPuuid(puuid: SummonerPuuid)
        case ById(id: SummonerId)
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
        switch self.method {
        case .ByAccountId:
            return "SummonerByAccountId"
        case .ByName, .ById, .byPuuid:
            return "SummonerBy-\(self.service.region.rawValue)"
        }
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
        }
    }
    
    func getMethodBody() -> Data? {
        return nil
    }
    
    func getWarningMessage() -> String? {
        switch self.method {
        case .ByAccountId, .ByName, .byPuuid:
            return nil
        case .ById:
            return "Too many calls to unexisting TFTSummoner(by SummonerId) may result in Blacklist"
        }
    }
}
