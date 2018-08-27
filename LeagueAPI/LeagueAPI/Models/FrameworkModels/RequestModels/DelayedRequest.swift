//
//  DelayedRequest.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/27/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DelayedRequest {
    
    public private(set) var identifier: Int
    public private(set) var request: () -> Void
    public var canceled: Bool
    
    public init(identifier: Int, request: @escaping () -> Void) {
        self.identifier = identifier
        self.request = request
        self.canceled = false
    }
    
    public func execute() {
        if !self.canceled {
            self.request()
        }
    }
}
