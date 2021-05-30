//
//  StatusMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class StatusMethod: LeagueMethod {
    
    public enum StatusMethods: CustomStringConvertible {
        case GetStatus
        
        public var description: String {
            var methodDescription: String {
                switch self {
                case .GetStatus:
                    return "GetStatus"
                }
            }
            return "\(String(describing: StatusMethods.self))-\(methodDescription)"
        }
    }
    
    private var service: ServiceProxy
    private var method: StatusMethods
    
    public init(method: StatusMethods, region: Region) {
        self.method = method
        self.service = ServiceProxy(for: region)
    }
    
    public func getAccessMethod() -> RESTRequester.AccessMethod {
        return .GET
    }
    
    public func getMethodSignature() -> String {
        return self.method.description
    }
    
    public func getMethodUrl() -> String {
        let entrypoint: String = self.service.hostUrl
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.Status.rawValue)/\(Version.LOL_API)/platform-data"
        switch self.method {
        case .GetStatus:
            return "\(commonPath)"
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
