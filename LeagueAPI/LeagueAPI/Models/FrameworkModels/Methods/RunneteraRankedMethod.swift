//
//  RunneteraRankedMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 3/28/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

internal class RunneteraRankedMethod: LeagueMethod {
    
    public enum RunneteraRankedMethods {
        case GetLeaderboard
    }
    
    private var service: ServiceProxy
    private var method: RunneteraRankedMethods
    
    public init(method: RunneteraRankedMethods, region: WorldRegion) {
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
        let entrypoint: String = self.service.worldRegionHostUrl
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.RunneteraRanked.rawValue)/\(Version.RUNNETERA_API)"
        switch self.method {
        case .GetLeaderboard:
            return "\(commonPath)/leaderboards"
        }
    }
    
    func getMethodBody() -> Data? {
        return nil
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
