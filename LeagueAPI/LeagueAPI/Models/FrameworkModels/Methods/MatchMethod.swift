//
//  MatchMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class MatchMethod: LeagueMethod {
    
    public enum MatchMethods {
        case ById(id: GameId)
        case MatchesByAccountId(id: AccountId, beginTime: Datetime?, endTime: Datetime?, beginIndex: Int?, endIndex: Int?, championId: ChampionId?, queue: QueueMode?, season: Season?)
        case TimelineById(id: GameId)
        case MatchIdsByTournamentCode(code: TournamentCode)
        case ByIdAndTournamentCode(id: GameId, code: TournamentCode)
    }
    
    private var service: ServiceProxy
    private var method: MatchMethods
    
    public init(method: MatchMethods, region: Region) {
        self.method = method
        self.service = ServiceProxy(for: region)
    }
    
    func getAccessMethod() -> RESTRequester.AccessMethod {
        return .GET
    }
    
    func getMethodSignature() -> String {
        switch self.method {
        case .ById, .TimelineById:
            return "MatchAndTimelineById"
        case .MatchesByAccountId:
            return "MatchesByAccountId"
        case .MatchIdsByTournamentCode, .ByIdAndTournamentCode:
            return "Default"
        }
    }
    
    func getMethodUrl() -> String {
        let entrypoint: String = self.service.hostUrl
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.Match.rawValue)/\(Version.LOL_API)"
        switch self.method {
        case .ById(let id):
            return "\(commonPath)/matches/\(id)"
        case .MatchesByAccountId(let id, let beginTime, let endTime, let beginIndex, let endIndex, let championId, let queue, let season):
            var queryParameters: [String : Any] = [:]
            if let beginTime = beginTime, let timestamp = beginTime.intervalFrom1970() { queryParameters["beginTime"] = Long(timestamp) }
            if let endTime = endTime, let timestamp = endTime.intervalFrom1970() { queryParameters["endTime"] = Long(timestamp) }
            if let beginIndex = beginIndex { queryParameters["beginIndex"] = beginIndex }
            if let endIndex = endIndex { queryParameters["endIndex"] = endIndex }
            if let championId = championId { queryParameters["champion"] = championId }
            if let queue = queue { queryParameters["queue"] = queue.mode.rawValue }
            if let season = season { queryParameters["season"] = season.season.rawValue }
            var queryParametersUrl: String = queryParameters.count == 0 ? "" : "?"
            for parameter in queryParameters {
                queryParametersUrl += "\(queryParametersUrl == "" ? "" : "&")\(parameter.key)=\(parameter.value)"
            }
            return "\(commonPath)/matchlists/by-account/\(id)\(queryParametersUrl)"
        case .TimelineById(let id):
            return "\(commonPath)/timelines/by-match/\(id)"
        case .MatchIdsByTournamentCode(let code):
            return "\(commonPath)/matches/by-tournament-code/\(code)/ids"
        case .ByIdAndTournamentCode(let id, let code):
            return "\(commonPath)/matches/\(id)/by-tournament-code/\(code)"
        }
    }
    
    func getMethodBody() -> Data? {
        return nil
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
