//
//  PrimitiveType.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/2/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

protocol PrimitiveType {
    static func cast(from data: Data) -> Any?
}

extension Int64: PrimitiveType {
    static func cast(from data: Data) -> Any? {
        guard let dataStr = String.cast(from: data) as? String else { return nil }
        return Int64(dataStr)
    }
}
extension String: PrimitiveType {
    static func cast(from data: Data) -> Any? {
        return String(data: data, encoding: .utf8)
    }
}
extension Int: PrimitiveType {
    static func cast(from data: Data) -> Any? {
        guard let dataStr = String.cast(from: data) as? String else { return nil }
        return Int(dataStr)
    }
}

protocol ArrayProtocol {
    static func type() -> Array<Any>.Element.Type
}

extension Array: ArrayProtocol {
    static func type() -> Any.Type {
        return self.Element.self
    }
}

internal class PrimitiveTypeCheck {
    
    public static func isPrimitive(_ type: Any.Type) -> Bool {
        if let arrayType = type as? ArrayProtocol.Type {
            let nestedType: Any.Type = arrayType.type()
            return nestedType is PrimitiveType.Type
        }
        else {
            return type is PrimitiveType.Type
        }
    }
    
    public static func cast(from data: Data?, into type: Any.Type) -> Any? {
        guard let data = data else { return nil }
        if let primitiveType = type as? PrimitiveType.Type {
            return primitiveType.cast(from: data)
        }
        else {
            return data as Any
        }
    }
}
