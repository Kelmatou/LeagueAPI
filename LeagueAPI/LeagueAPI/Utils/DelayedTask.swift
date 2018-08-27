//
//  DelayedTask.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/27/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DelayedTask {
    
    private var queue: DispatchQueue
    private var task: () -> Void
    
    public init(taskName: String, task: @escaping () -> Void) {
        let frameworkBundle: Bundle = Bundle(for: LeagueAPI.self)
        let queueName: String = "\(frameworkBundle.bundleIdentifier ?? "com.kelmatou.LeagueAPI").\(taskName)"
        self.queue = DispatchQueue(label: queueName)
        self.task = task
    }
    
    public func execute(after duration: Duration) {
        queue.asyncAfter(deadline: .now() + duration.durationSeconds) {
            self.task()
        }
    }
}
