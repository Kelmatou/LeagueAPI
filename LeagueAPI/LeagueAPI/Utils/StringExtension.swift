//
//  StringExtension.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/17/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal extension String {
    
    /**
     Get a substring of current String object
     
     - parameter startIndex: the starting character position
     
     - returns: a substring starting at start index and finishing at the end of current string. nil is returned if startIndex is out of range
     */
    func substring(startIndex: Int) -> String? {
        guard startIndex >= 0 && startIndex <= count else {
            return nil
        }
        let startStringIndex: String.Index = self.index(self.startIndex, offsetBy: startIndex)
        let substring: Substring = self[startStringIndex...]
        return String(substring)
    }
    
    /**
     Get a substring of current String object
     
     - parameter startIndex: the starting character position
     - parameter length: the desired length of the new String
     
     - returns: a substring starting at start index with a length() of length. If length parameter is too big, stops at the last character.
     nil is returned if startIndex is out of range or if a negative length was passed.
     */
    func substring(startIndex: Int, length: Int) -> String? {
        guard startIndex >= 0 && startIndex <= count && length >= 0 else {
            return nil
        }
        let startStringIndex: String.Index = self.index(self.startIndex, offsetBy: startIndex)
        let endPosition: Int = startIndex + length > count ? count : startIndex + length
        let endStringIndex: String.Index = self.index(self.startIndex, offsetBy: endPosition)
        let range: Range<String.Index> = startStringIndex..<endStringIndex
        let substring: Substring = self[range]
        return String(substring)
    }
    
    func equals(_ str: String) -> Bool {
        return self.lowercased() == str.lowercased()
    }
}
