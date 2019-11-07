//
//  TFTRankedMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/6/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

internal class TFTRankedMethod: LeagueMethod {
    
    public enum TFTRankedMethods {
        case GetChallenger
        case EntriesByTierAndDivision(division: RankedDivision, page: Int)
        case EntriesById(id: SummonerId)
        case GetGrandMaster
        case LeagueById(id: TFTLeagueId)
        case GetMaster
    }
    
    private var service: ServiceProxy
    private var method: TFTRankedMethods
    
    public init(method: TFTRankedMethods, region: Region) {
        self.method = method
        self.service = ServiceProxy(for: region)
    }
    
    public func getAccessMethod() -> RESTRequester.AccessMethod {
        return .GET
    }
    
    public func getMethodSignature() -> String {
        return "TFTLeague"
    }
    
    public func getMethodUrl() -> String {
        let entrypoint: String = self.service.hostUrl
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.TFTLeague.rawValue)/\(Version.TFT_API)"
        switch self.method {
        case .GetChallenger:
            return "\(commonPath)/challenger"
        case .EntriesById(let id):
            return "\(commonPath)/entries/by-summoner/\(id)"
        case .EntriesByTierAndDivision(let division, let page):
            return "\(commonPath)/entries/\(division.tier.tier.rawValue)/\(division.divisionRoman)?page=\(page)"
        case .GetGrandMaster:
            return "\(commonPath)/grandmaster"
        case .LeagueById(let id):
            return "\(commonPath)/leagues/\(id)"
        case .GetMaster:
            return "\(commonPath)/master"
        }
    }
    
    func getMethodBody() -> Data? {
        return nil
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
