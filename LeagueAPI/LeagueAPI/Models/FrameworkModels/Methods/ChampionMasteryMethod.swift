//
//  ChampionMasteryMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ChampionMasteryMethod: LeagueMethod {

    public enum ChampionMasteryMethods: CustomStringConvertible {
        case BySummonerId(id: SummonerId)
        case BySummonerIdAndChampionId(summonerId: SummonerId, championId: ChampionId)
        case ScoreBySummonerId(id: SummonerId)
        
        public var description: String {
            var methodDescription: String {
                switch self {
                case .BySummonerId:
                    return "BySummonerId"
                case .BySummonerIdAndChampionId:
                    return "BySummonerIdAndChampionId"
                case .ScoreBySummonerId:
                    return "ScoreBySummonerId"
                }
            }
            return "\(String(describing: ChampionMasteryMethods.self))-\(methodDescription)"
        }
    }
    
    private var service: ServiceProxy
    private var method: ChampionMasteryMethods
    
    public init(method: ChampionMasteryMethods, region: Region) {
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
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.ChampionMastery.rawValue)/\(Version.LOL_API)"
        switch self.method {
        case .BySummonerId(let id):
            return "\(commonPath)/champion-masteries/by-summoner/\(id)"
        case .BySummonerIdAndChampionId(let summonerId, let championId):
            return "\(commonPath)/champion-masteries/by-summoner/\(summonerId)/by-champion/\(championId)"
        case .ScoreBySummonerId(let id):
            return "\(commonPath)/scores/by-summoner/\(id)"
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
