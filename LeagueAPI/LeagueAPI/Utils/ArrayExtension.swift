//
//  ArrayExtension.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/25/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public extension Array {
    
    mutating func append(_ sequence: Array) {
        for element in sequence {
            self.append(element)
        }
    }
    
    mutating func keepLast(n: Int) {
        guard n > 0 else { self = []; return }
        guard n < self.count else { return }
        let numberToRemove: Int = self.count - n
        self.removeFirst(numberToRemove)
    }
    
    mutating func fill(with element: Element, untilCount newCount: Int) {
        while self.count < newCount {
            self.append(element)
        }
    }
    
    func firstMatch(where filterFunction: (Element) -> Bool, notFoundMessage: String? = nil, completion: @escaping (Element?, String?) -> Void) {
        if let match = self.first(where: filterFunction) {
            completion(match, nil)
        }
        else {
            completion(nil, notFoundMessage)
        }
    }
    
    mutating func removeAll(where removeCondition: (Element) -> Bool) {
        self = self.filter { !removeCondition($0) }
    }
    
    @discardableResult mutating func removeFirst(where removeCondition: @escaping (Element) -> Bool) -> Element? {
        let elementToRemove: Element? = self.first(where: { removeCondition($0) })
        var found: Bool = false
        let removeFirstCondition: (Element) -> Bool = { element in
            guard !found else {
                return false
            }
            found = removeCondition(element)
            return found
        }
        self = self.filter { !removeFirstCondition($0) }
        return elementToRemove
    }
}

extension Array where Element: Equatable {
    
    public mutating func remove(_ element: Element) {
        self = self.filter { $0 != element }
    }
}
