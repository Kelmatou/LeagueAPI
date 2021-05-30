//
//  TournamentStubMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/29/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class TournamentStubMethod: LeagueMethod {
    
    public enum TournamentStubMethods: CustomStringConvertible {
        case CreateCodes(amount: Int?, tournamentId: TournamentId, info: TournamentInfo)
        case EventsByTournamentCode(code: TournamentCode)
        case CreateProvider(callbackUrl: String, region: TournamentRegion)
        case CreateTournament(name: String, providerId: ProviderId)
        
        public var description: String {
            var methodDescription: String {
                switch self {
                case .CreateCodes:
                    return "CreateCodes"
                case .EventsByTournamentCode:
                    return "EventsByTournamentCode"
                case .CreateProvider:
                    return "CreateProvider"
                case .CreateTournament:
                    return "CreateTournament"
                }
            }
            return "\(String(describing: TournamentStubMethods.self))-\(methodDescription)"
        }
    }
    
    private var host: Endpoint
    private var method: TournamentStubMethods
    
    public init(method: TournamentStubMethods) {
        self.method = method
        self.host = .America
    }
    
    public func getAccessMethod() -> RESTRequester.AccessMethod {
        switch self.method {
        case .CreateCodes, .CreateProvider, .CreateTournament:
            return .POST
        case .EventsByTournamentCode:
            return .GET
        }
    }
    
    public func getMethodSignature() -> String {
        return self.method.description
    }
    
    public func getMethodUrl() -> String {
        let entrypoint: String = self.host.rawValue
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.TournamentStub.rawValue)/\(Version.LOL_API)"
        switch self.method {
        case .CreateCodes(let amount, let tournamentId, _):
            return "\(commonPath)/codes?tournamentId=\(tournamentId)&count=\(amount ?? 1)"
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
        case .EventsByTournamentCode:
            return nil
        case .CreateProvider(let callbackUrl, let region):
            let tournamentProvider: TournamentProvider = TournamentProvider(region: region.region.rawValue, url: callbackUrl)
            return ObjectMapper.encode(tournamentProvider)
        case .CreateTournament(let name, let providerId):
            let tournamentInitializer: TournamentInitializer = TournamentInitializer(name: name, providerId: providerId)
            return ObjectMapper.encode(tournamentInitializer)
        }
    }
    
    func getCustomHeaders() -> [String: String] {
        return [:]
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
