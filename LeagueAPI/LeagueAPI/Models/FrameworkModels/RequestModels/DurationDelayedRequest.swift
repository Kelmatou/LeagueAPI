//
//  DurationDelayedRequest.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/27/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DurationDelayedRequest: DelayedRequest {
    
    public var delay: Duration
    
    public init(identifier: Int, delay: Duration, request: @escaping () -> Void) {
        self.delay = delay
        super.init(identifier: identifier, request: request)
    }
    
    public func start() {
        let delayedTask: DelayedTask = DelayedTask(taskName: "DelayedRequest", task: { self.execute() })
        delayedTask.execute(after: self.delay)
    }
}
