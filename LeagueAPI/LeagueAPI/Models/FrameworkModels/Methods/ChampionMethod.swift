//
//  ChampionMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ChampionMethod: LeagueMethod {
    
    public enum ChampionMethods: CustomStringConvertible {
        case ChampionRotation
        
        public var description: String {
            var methodDescription: String {
                switch self {
                case .ChampionRotation:
                    return "ChampionRotation"
                }
            }
            return "\(String(describing: ChampionMethods.self))-\(methodDescription)"
        }
    }
    
    private var service: ServiceProxy
    private var method: ChampionMethods
    
    public init(method: ChampionMethods, region: Region) {
        self.method = method
        self.service = ServiceProxy(for: region)
    }
    
    func getAccessMethod() -> RESTRequester.AccessMethod {
        return .GET
    }
    
    func getMethodSignature() -> String {
        return self.method.description
    }
    
    func getMethodUrl() -> String {
        let entrypoint: String = self.service.hostUrl
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.Platform.rawValue)/v3"
        switch self.method {
        case .ChampionRotation:
            return "\(commonPath)/champion-rotations"
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
