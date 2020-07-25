//
//  TFTMatchMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/6/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

internal class TFTMatchMethod: LeagueMethod {
    
    public enum TFTMatchMethods {
        case byPuuid(puuid: SummonerPuuid, count: Int?)
        case ById(id: TFTGameId)
    }
    
    private var service: ServiceProxy
    private var method: TFTMatchMethods
    
    public init(method: TFTMatchMethods, region: Region) {
        self.method = method
        self.service = ServiceProxy(for: region)
    }
    
    public func getAccessMethod() -> RESTRequester.AccessMethod {
        return .GET
    }
    
    public func getMethodSignature() -> String {
        switch self.method {
        case .byPuuid:
            return "TFTMatchByPuuid"
        case .ById:
            return "TFTMatchById"
        }
    }
    
    public func getMethodUrl() -> String {
        let entrypoint: String = self.service.worldRegionHostUrl
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.TFTMatch.rawValue)/\(Version.TFT_API)/matches"
        switch self.method {
        case .byPuuid(let puuid, let count):
            return "\(commonPath)/by-puuid/\(puuid)/ids?count=\(count ?? 20)"
        case .ById(let id):
            return "\(commonPath)/\(id)"
        }
    }
    
    func getMethodBody() -> Data? {
        return nil
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
