//
//  RunneteraInventoryMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 5/30/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

internal class RunneteraInventoryMethod: LeagueMethod {
    
    public enum RunneteraInventoryMethods: CustomStringConvertible {
        case GetByAuthorizationToken(token: String)
        
        public var description: String {
            var methodDescription: String {
                switch self {
                case .GetByAuthorizationToken:
                    return "GetByAuthorizationToken"
                }
            }
            return "\(String(describing: RunneteraInventoryMethods.self))-\(methodDescription)"
        }
    }
    
    private var service: ServiceProxy
    private var method: RunneteraInventoryMethods
    
    public init(method: RunneteraInventoryMethods, region: WorldRegion) {
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
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.RunneteraInventory.rawValue)/\(Version.RUNNETERA_API)/cards"
        switch self.method {
        case .GetByAuthorizationToken:
            return "\(commonPath)/me"
        }
    }
    
    func getMethodBody() -> Data? {
        return nil
    }
    
    func getCustomHeaders() -> [String: String] {
        switch self.method {
        case .GetByAuthorizationToken(let token):
            return ["Authorization": token]
        }
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
