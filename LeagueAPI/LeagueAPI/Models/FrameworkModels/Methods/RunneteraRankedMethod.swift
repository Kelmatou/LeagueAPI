//
//  RunneteraRankedMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 3/28/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

internal class RunneteraRankedMethod: LeagueMethod {
    
    public enum RunneteraRankedMethods: CustomStringConvertible {
        case GetLeaderboard
        
        public var description: String {
            var methodDescription: String {
                switch self {
                case .GetLeaderboard:
                    return "GetLeaderboard"
                }
            }
            return "\(String(describing: RunneteraRankedMethods.self))-\(methodDescription)"
        }
    }
    
    private var service: ServiceProxy
    private var method: RunneteraRankedMethods
    
    public init(method: RunneteraRankedMethods, region: WorldRegion) {
        self.method = method
        self.service = ServiceProxy(for: region)
        self.service.allowSouthEastAsiaWorldRegion = true
    }
    
    public func getAccessMethod() -> RESTRequester.AccessMethod {
        return .GET
    }
    
    public func getMethodSignature() -> String {
        return self.method.description
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
    
    func getCustomHeaders() -> [String: String] {
        return [:]
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
