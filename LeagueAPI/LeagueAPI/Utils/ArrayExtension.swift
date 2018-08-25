//
//  ArrayExtension.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/25/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public extension Array {
    
    public mutating func append(_ sequence: Array) {
        for element in sequence {
            self.append(element)
        }
    }
    
    public func firstMatch(filterFunction: (Element) -> Bool, notFoundMessage: String? = nil, completion: @escaping (Element?, String?) -> Void) {
        if let match = self.first(where: filterFunction) {
            completion(match, nil)
        }
        else {
            completion(nil, notFoundMessage)
        }
    }
}
