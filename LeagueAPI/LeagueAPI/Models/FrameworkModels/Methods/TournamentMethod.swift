//
//  TournamentMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class TournamentMethod: LeagueMethod {
    
    public enum TournamentMethods {
        case CreateCodes(amount: Int?, tournamentId: TournamentId, info: TournamentInfo)
        case UpdateTournamentInfo(code: TournamentCode, updatedInfo: TournamentUpdate?)
        case GetTournamentInfo(code: TournamentCode)
        case EventsByTournamentCode(code: TournamentCode)
        case CreateProvider(callbackUrl: String, region: TournamentRegion)
        case CreateTournament(name: String, providerId: ProviderId)
    }
    
    private var host: Endpoint
    private var method: TournamentMethods
    
    public init(method: TournamentMethods) {
        self.method = method
        self.host = .America
    }
    
    public func getAccessMethod() -> RESTRequester.AccessMethod {
        switch self.method {
        case .CreateCodes, .CreateProvider, .CreateTournament:
            return .POST
        case .GetTournamentInfo, .EventsByTournamentCode:
            return .GET
        case .UpdateTournamentInfo:
            return .PUT
        }
    }
    
    public func getMethodSignature() -> String {
        return "Tournament" // Since documentation does not explain Tournament Rate Limit, we create a special queue to count rate limit.
    }
    
    public func getMethodUrl() -> String {
        let entrypoint: String = self.host.rawValue
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.Tournament.rawValue)/\(Version.LOL_API)"
        switch self.method {
        case .CreateCodes(let amount, let tournamentId, _):
            return "\(commonPath)/codes?tournamentId=\(tournamentId)&count=\(amount ?? 1)"
        case .UpdateTournamentInfo(let code, _), .GetTournamentInfo(let code):
            return "\(commonPath)/codes/\(code)"
        case .EventsByTournamentCode(let code):
            return "\(commonPath)/lobby-events/by-code/\(code)"
        case .CreateProvider:
            return "\(commonPath)/providers"
        case .CreateTournament:
            return "\(commonPath)/tournaments"
        }
    }
    
    func getMethodBody() -> Data? {
        switch self.method {
        case .CreateCodes(_, _, let info):
            return ObjectMapper.encode(info)
        case .UpdateTournamentInfo(_, let updatedInfo):
            return ObjectMapper.encode(updatedInfo)
        case .EventsByTournamentCode, .GetTournamentInfo:
            return nil
        case .CreateProvider(let callbackUrl, let region):
            let tournamentProvider: TournamentProvider = TournamentProvider(region: region.region.rawValue, url: callbackUrl)
            return ObjectMapper.encode(tournamentProvider)
        case .CreateTournament(let name, let providerId):
            let tournamentInitializer: TournamentInitializer = TournamentInitializer(name: name, providerId: providerId)
            return ObjectMapper.encode(tournamentInitializer)
        }
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
