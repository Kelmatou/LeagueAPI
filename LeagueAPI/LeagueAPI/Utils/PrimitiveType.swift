//
//  PrimitiveType.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/2/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

protocol PrimitiveType {}
extension Int64: PrimitiveType {}
extension String: PrimitiveType {}
extension Int: PrimitiveType {}

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
}
