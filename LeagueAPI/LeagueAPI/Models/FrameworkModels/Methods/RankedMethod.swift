//
//  RankedMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class RankedMethod: LeagueMethod {
    
    public enum RankedMethods {
        case ChallengerByQueue(queue: Queue)
        case MasterByQueue(queue: Queue)
        case LeagueById(id: LeagueId)
        case PositionsById(id: SummonerId)
    }
    
    private var service: ServiceProxy
    private var method: RankedMethods
    
    public init(method: RankedMethods, region: Region) {
        self.method = method
        self.service = ServiceProxy(for: region)
    }
    
    func getAccessMethod() -> RESTRequester.AccessMethod {
        return .GET
    }
    
    func getMethodSignature() -> String {
        switch self.method {
        case .LeagueById, .ChallengerByQueue, .MasterByQueue:
            return "League"
        case .PositionsById:
            return "PositionsById-\(self.service.region.rawValue)"
        }
    }
    
    func getMethodUrl() -> String {
        let entrypoint: String = self.service.hostUrl
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.League.rawValue)/\(Version.RiotAPI)"
        switch self.method {
        case .ChallengerByQueue(let queue):
            return "\(commonPath)/challengerleagues/by-queue/\(queue.type.rawValue)"
        case .LeagueById(let id):
            return "\(commonPath)/leagues/\(id)"
        case .MasterByQueue(let queue):
            return "\(commonPath)/masterleagues/by-queue/\(queue.type.rawValue)"
        case .PositionsById(let id):
            return "\(commonPath)/positions/by-summoner/\(id)"
        }
    }
    
    func getMethodBody() -> Data? {
        return nil
    }
    
    func getWarningMessage() -> String? {
        switch self.method {
        case .ChallengerByQueue, .MasterByQueue, .PositionsById:
            return nil
        case .LeagueById:
            return "Too many calls to unexisting League(by LeagueId) may result in Blacklist"
        }
    }
}
