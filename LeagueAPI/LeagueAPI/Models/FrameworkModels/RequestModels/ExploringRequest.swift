//
//  ExploringRequest.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/27/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal protocol ExploringRequest {
    
    func getidentifier() -> String?
    func addWaitingRequest(_ request: DelayedRequest)
    func getWaitingRequests() -> [DelayedRequest]
}
