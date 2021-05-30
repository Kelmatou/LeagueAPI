//
//  RunneteraDeckMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 5/30/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

internal class RunneteraDeckMethod: LeagueMethod {
    
    public enum RunneteraDeckMethods: CustomStringConvertible {
        case GetDecksByAuthorizationToken(token: String)
        case CreateDeckByAuthorizationToken(token: String, deckInfo: RunneteraDeckCreation)
        
        public var description: String {
            var methodDescription: String {
                switch self {
                case .GetDecksByAuthorizationToken:
                    return "GetDecksByAuthorizationToken"
                case .CreateDeckByAuthorizationToken:
                    return "CreateDeckByAuthorizationToken"
                }
            }
            return "\(String(describing: RunneteraDeckMethods.self))-\(methodDescription)"
        }
    }
    
    private var service: ServiceProxy
    private var method: RunneteraDeckMethods
    
    public init(method: RunneteraDeckMethods, region: WorldRegion) {
        self.method = method
        self.service = ServiceProxy(for: region)
        self.service.allowSouthEastAsiaWorldRegion = true
    }
    
    public func getAccessMethod() -> RESTRequester.AccessMethod {
        switch self.method {
        case .GetDecksByAuthorizationToken:
            return .GET
        case .CreateDeckByAuthorizationToken:
            return .POST
        }
    }

    public func getMethodSignature() -> String {
        return self.method.description
    }
    
    public func getMethodUrl() -> String {
        let entrypoint: String = self.service.worldRegionHostUrl
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.RunneteraDeck.rawValue)/\(Version.RUNNETERA_API)/decks"
        switch self.method {
        case .GetDecksByAuthorizationToken, .CreateDeckByAuthorizationToken:
            return "\(commonPath)/me"
        }
    }
    
    func getMethodBody() -> Data? {
        switch self.method {
        case .GetDecksByAuthorizationToken:
            return nil
        case .CreateDeckByAuthorizationToken(_, let deckInfo):
            return ObjectMapper.encode(deckInfo)
        }
    }
    
    func getCustomHeaders() -> [String: String] {
        switch self.method {
        case .GetDecksByAuthorizationToken(let token), .CreateDeckByAuthorizationToken(let token, _):
            return ["Authorization": token]
        }
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
