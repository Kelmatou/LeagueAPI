//
//  Logger.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class Logger {
    
    public static func print(_ message: String) {
        print(message)
    }
    
    public static func error(_ message: String) {
        Logger.print("Error: \(message)")
    }
    
    public static func warning(_ message: String) {
        Logger.print("Warning: \(message)")
    }
}
