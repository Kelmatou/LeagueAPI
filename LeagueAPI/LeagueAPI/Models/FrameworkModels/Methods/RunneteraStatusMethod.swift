//
//  RunneteraStatusMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 1/11/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

internal class RunneteraStatusMethod: LeagueMethod {
    
    public enum RunneteraStatusMethods {
        case GetStatus
    }
    
    private var service: ServiceProxy
    private var method: RunneteraStatusMethods
    
    public init(method: RunneteraStatusMethods, region: WorldRegion) {
        self.method = method
        self.service = ServiceProxy(for: region)
        self.service.allowSouthEastAsiaWorldRegion = true
    }
    
    public func getAccessMethod() -> RESTRequester.AccessMethod {
        return .GET
    }
    
    public func getMethodSignature() -> String {
        return "Default"
    }
    
    public func getMethodUrl() -> String {
        let entrypoint: String = self.service.worldRegionHostUrl
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.RunneteraStatus.rawValue)/v1/platform-data"
        switch self.method {
        case .GetStatus:
            return "\(commonPath)"
        }
    }
    
    func getMethodBody() -> Data? {
        return nil
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
