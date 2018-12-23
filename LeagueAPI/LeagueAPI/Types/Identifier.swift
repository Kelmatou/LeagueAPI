//
//  Identifier.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/23/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Identifier<T: Codable & Hashable>: Equatable, CustomStringConvertible, Hashable {
    
    public var value: T
    
    public var description: String {
        return "\(value)"
    }
    
    public init(_ value: T) {
        self.value = value
    }
    
    public static func ==(lhs: Identifier<T>, rhs: Identifier<T>) -> Bool {
        return lhs.value == rhs.value
    }
    
    public static func ==(lhs: Identifier<T>, rhs: T) -> Bool {
        return lhs.value == rhs
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.value)
    }
}
