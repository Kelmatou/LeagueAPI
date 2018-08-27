//
//  ExploringLeagueRequest.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/27/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ExploringLeagueRequest<ResultType: Decodable>: ExploringRequest {
    
    public private(set) var identifier: String?
    public private(set) var handler: (ResultType?, String?) -> Void
    public var waitingRequests: [DelayedRequest]
    
    public init(identifier: String?, handler: @escaping (ResultType?, String?) -> Void) {
        self.identifier = identifier
        self.handler = handler
        self.waitingRequests = []
    }
    
    func getidentifier() -> String? {
        return self.identifier
    }
    
    func addWaitingRequest(_ request: DelayedRequest) {
        self.waitingRequests.append(request)
    }
    
    func getWaitingRequests() -> [DelayedRequest] {
        return self.waitingRequests
    }
}
