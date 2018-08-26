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
    
    public mutating func keepLast(n: Int) {
        guard n > 0 else { self = []; return }
        guard n < self.count else { return }
        let numberToRemove: Int = self.count - n
        self.removeFirst(numberToRemove)
    }
    
    public mutating func fill(with element: Element, untilCount newCount: Int) {
        while self.count < newCount {
            self.append(element)
        }
    }
    
    public func firstMatch(where filterFunction: (Element) -> Bool, notFoundMessage: String? = nil, completion: @escaping (Element?, String?) -> Void) {
        if let match = self.first(where: filterFunction) {
            completion(match, nil)
        }
        else {
            completion(nil, notFoundMessage)
        }
    }
}
