//
//  DateToken.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/17/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

open class DateToken {
    
    public enum Tokens: String {
        case Year4Digits = "yyyy"
        case Year2Digits = "yy"
        case MonthDigits = "MM"
        case DayDigits = "dd"
        case HourDigits = "hh"
        case MinuteDigits = "mm"
        case SecondDigits = "ss"
        case MonthShort = "MS"
        case MonthLong = "ML"
        case DayShort = "dS"
        case DayLong = "dL"
        case Other
    }
    
    public var type: Tokens
    public var match: String
    
    public init(type: Tokens, match: String) {
        self.type = type
        self.match = match
    }
    
    public static func match(tokens: [DateToken], with string: String) -> Bool {
        var index: Int = 0
        for token in tokens {
            if token.type == .Other {
                if let stringExtract = string.substring(startIndex: index, length: token.match.count), token.match != stringExtract {
                    return false
                }
                index += token.match.count
            }
            else if let matchStr = delimitateTokenMatch(token: token, string: string, at: index) {
                token.match = matchStr
                index += token.match.count
            }
            else {
                return false
            }
        }
        return true
    }
    
    public static func tokenList(from pattern: String) -> [DateToken] {
        var listOfToken: [DateToken] = []
        var index: Int = 0
        while (index < pattern.count) {
            if let tokenFound = recognizeToken(pattern, at: index) {
                listOfToken.append(DateToken(type: tokenFound, match: ""))
                index += tokenFound.rawValue.count
            }
            else {
                if let lastToken = listOfToken.last, lastToken.type == .Other {
                    lastToken.match += pattern.substring(startIndex: index, length: 1) ?? ""
                }
                else {
                    let tokenMatch: String = pattern.substring(startIndex: index, length: 1) ?? ""
                    listOfToken.append(DateToken(type: .Other, match: tokenMatch))
                }
                index += 1
            }
        }
        return listOfToken
    }
    
    public static func recognizeToken(_ str: String, at index: Int) -> Tokens? {
        if let next4bytes = str.substring(startIndex: index, length: 4) {
            if next4bytes == Tokens.Year4Digits.rawValue { return Tokens.Year4Digits }
        }
        if let next2bytes = str.substring(startIndex: index, length: 2) {
            if next2bytes == Tokens.Year2Digits.rawValue { return Tokens.Year2Digits }
            if next2bytes == Tokens.MonthDigits.rawValue { return Tokens.MonthDigits }
            if next2bytes == Tokens.DayDigits.rawValue { return Tokens.DayDigits }
            if next2bytes == Tokens.HourDigits.rawValue { return Tokens.HourDigits }
            if next2bytes == Tokens.MinuteDigits.rawValue { return Tokens.MinuteDigits }
            if next2bytes == Tokens.SecondDigits.rawValue { return Tokens.SecondDigits }
            if next2bytes == Tokens.MonthShort.rawValue { return Tokens.MonthShort }
            if next2bytes == Tokens.MonthLong.rawValue { return Tokens.MonthLong }
            if next2bytes == Tokens.DayShort.rawValue { return Tokens.DayShort }
            if next2bytes == Tokens.DayLong.rawValue { return Tokens.DayLong }
        }
        return nil
    }
    
    private static func delimitateTokenMatch(token: DateToken, string: String, at index: Int) -> String? {
        switch token.type {
        case .Year4Digits:
            return string.substring(startIndex: index, length: 4)
        case .MonthShort, .DayShort:
            return string.substring(startIndex: index, length: 3)
        case .Year2Digits, .MonthDigits, .DayDigits, .HourDigits, .MinuteDigits, .SecondDigits:
            return string.substring(startIndex: index, length: 2)
        case .MonthLong:
            return delimitateMonthMatch(string: string, at: index)
        case .DayLong:
            return delimitateDayMatch(string: string, at: index)
        case .Other:
            return ""
        }
    }
    
    private static func delimitateMonthMatch(string: String, at index: Int) -> String? {
        for i in 1 ... 12 {
            if let monthName = Datetime.monthFromInt(i)?.rawValue {
                if let stringExtract = string.substring(startIndex: index, length: monthName.count) {
                    if monthName == stringExtract {
                        return monthName
                    }
                }
            }
        }
        return nil
    }
    
    private static func delimitateDayMatch(string: String, at index: Int) -> String? {
        for i in 1 ... 7 {
            if let dayName = Datetime.weekDayFromInt(i)?.rawValue {
                if let stringExtract = string.substring(startIndex: index, length: dayName.count) {
                    if dayName == stringExtract {
                        return dayName
                    }
                }
            }
        }
        return nil
    }
}
