//
//  Logger.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

open class Logger {
    
    public enum Access {
        case Info
        case Warning
        case Error
    }
    
    public static var access: [Access : Bool] = [
        .Info : true,
        .Warning : true,
        .Error : true
    ]
    
    open static func print(_ message: String) {
        guard access[.Info] ?? false else { return }
        Swift.print(message)
    }
    
    open static func warning(_ message: String) {
        guard access[.Warning] ?? false else { return }
        Logger.print("Warning: \(message)")
    }
    
    open static func error(_ message: String) {
        guard access[.Error] ?? false else { return }
        Logger.print("Error: \(message)")
    }
}
