//
//  Logger.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

open class Logger {
    
    public enum Channel {
        case Debug
        case Info
        case Warning
        case Error
    }
    
    public internal(set) static var channels: [Channel : Bool] = [
        .Debug: true,
        .Info : true,
        .Warning : true,
        .Error : true
    ]
    
    open static func setAllChannels(enabled: Bool) {
        channels = channels.mapValues { (_) in return enabled }
    }
    
    open static func setChannel(_ channel: Channel, enabled: Bool) {
        channels[channel] = enabled
    }
    
    open static func debug(_ message: String) {
        guard channels[.Debug] ?? true else { return }
        Swift.print("Debug: \(message)")
    }
    
    open static func print(_ message: String) {
        guard channels[.Info] ?? true else { return }
        Swift.print(message)
    }
    
    open static func warning(_ message: String) {
        guard channels[.Warning] ?? true else { return }
        Swift.print("Warning: \(message)")
    }
    
    open static func error(_ message: String) {
        guard channels[.Error] ?? true else { return }
        Swift.print("Error: \(message)")
    }
}
