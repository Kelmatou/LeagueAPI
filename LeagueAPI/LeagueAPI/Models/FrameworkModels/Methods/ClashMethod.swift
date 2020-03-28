//
//  ClashMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 3/28/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

internal class ClashMethod: LeagueMethod {
    
    public enum ClashMethods {
        case PlayersBySummonerId(summonerId: SummonerId)
        case TeamsByTeamId(teamId: TeamId)
        case Tournaments
        case TournamentsByTeamId(teamId: TeamId)
        case TournamentsByTournamentId(tournamentId: TournamentId)
    }
    
    private var service: ServiceProxy
    private var method: ClashMethods
    
    public init(method: ClashMethods, region: Region) {
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
        let entrypoint: String = self.service.hostUrl
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.Clash.rawValue)/\(Version.CLASH_API)"
        switch self.method {
        case .PlayersBySummonerId(let summonerId):
            return "\(commonPath)/players/by-summoner/\(summonerId)"
        case .TeamsByTeamId(let teamId):
            return "\(commonPath)/teams/\(teamId)"
        case .Tournaments:
            return "\(commonPath)/tournaments"
        case .TournamentsByTeamId(let teamId):
            return "\(commonPath)/tournaments/by-team/\(teamId)"
        case .TournamentsByTournamentId(let tournamentId):
            return "\(commonPath)/tournaments/\(tournamentId)"
        }
    }
    
    func getMethodBody() -> Data? {
        return nil
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
