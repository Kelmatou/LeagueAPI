//
//  PrimitiveType.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/2/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class PrimitiveType {
    
    public static func isPrimitive<Type>(_ type: Type.Type) -> Bool {
        return type == Int.self || type == Int64.self || type == String.self
            || type == [Int].self || type == [Int64].self || type == [String].self
    }
}
