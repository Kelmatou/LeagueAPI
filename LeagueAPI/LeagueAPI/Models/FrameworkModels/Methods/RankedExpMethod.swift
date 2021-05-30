//
//  RankedExoMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 9/7/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

internal class RankedExpMethod: LeagueMethod {
    
    public enum RankedExpMethods: CustomStringConvertible {
        case QueueEntries(queue: Queue, division: RankedDivision, page: Int)
        
        public var description: String {
            var methodDescription: String {
                switch self {
                case .QueueEntries:
                    return "QueueEntries"
                }
            }
            return "\(String(describing: RankedExpMethods.self))-\(methodDescription)"
        }
    }
    
    private var service: ServiceProxy
    private var method: RankedExpMethods
    
    public init(method: RankedExpMethods, region: Region) {
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
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.LeagueExp.rawValue)/\(Version.LOL_API)"
        switch self.method {
        case .QueueEntries(let queue, let division, let page):
            return "\(commonPath)/entries/\(queue.type.rawValue)/\(division.tier.tier.rawValue)/\(division.divisionRoman)?page=\(page)"
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
