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
        case None
        case Info
        case Warning
        case Error
    }
    
    public static var access: [Access : Bool] = [
        .None : false,
        .Info : true,
        .Warning : true,
        .Error : true
    ]
    
    open static func print(_ message: String) {
        guard !(access[.None] ?? false) && access[.Info] ?? true else { return }
        Swift.print(message)
    }
    
    open static func warning(_ message: String) {
        guard !(access[.None] ?? false) && access[.Warning] ?? true else { return }
        Logger.print("Warning: \(message)")
    }
    
    open static func error(_ message: String) {
        guard !(access[.None] ?? false) && access[.Error] ?? true else { return }
        Logger.print("Error: \(message)")
    }
}
