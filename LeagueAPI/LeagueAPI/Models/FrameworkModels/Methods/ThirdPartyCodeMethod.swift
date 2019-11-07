//
//  ThirdPartyCodeMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ThirdPartyCodeMethod: LeagueMethod {
    
    public enum ThirdPartyCodeMethods {
        case ById(id: SummonerId)
    }
    
    private var service: ServiceProxy
    private var method: ThirdPartyCodeMethods
    
    public init(method: ThirdPartyCodeMethods, region: Region) {
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
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.Platform.rawValue)/\(Version.LOL_API)/third-party-code"
        switch self.method {
        case .ById(let id):
            return "\(commonPath)/by-summoner/\(id)"
        }
    }
    
    func getMethodBody() -> Data? {
        return nil
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
