//
//  DatetimeEnums.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/17/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public extension Datetime {
    
    enum Month: String {
        case January = "January"
        case February = "February"
        case March = "March"
        case April = "April"
        case May = "May"
        case June = "June"
        case July = "July"
        case August = "August"
        case September = "September"
        case October = "October"
        case November = "November"
        case December = "December"
    }
    
    enum WeekDay: String {
        case Monday = "Monday"
        case Tuesday = "Tuesday"
        case Wednesday = "Wednesday"
        case Thursday = "Thursday"
        case Friday = "Friday"
        case Saturday = "Saturday"
        case Sunday = "Sunday"
    }
    
    /**
     Returns the name of month in year
     
     - parameter val: the index of the month in year (0 = Monday, 6 = Sunday)
     
     - returns: a Month representing month's name or nil if 1 > val or 12 < val
     */
    static func monthFromInt(_ val: Int) -> Month? {
        switch val {
        case 1:  return .January
        case 2:  return .February
        case 3:  return .March
        case 4:  return .April
        case 5:  return .May
        case 6:  return .June
        case 7:  return .July
        case 8:  return .August
        case 9:  return .September
        case 10: return .October
        case 11: return .November
        case 12: return .December
        default: return nil
        }
    }
    
    /**
     Returns the index of month in year
     
     - parameter month: the name of the month in year
     
     - returns: an index between 1 and 12 included
     */
    static func intFromMonth(_ month: Month) -> Int {
        switch month {
        case .January:   return 1
        case .February:  return 2
        case .March:     return 3
        case .April:     return 4
        case .May:       return 5
        case .June:      return 6
        case .July:      return 7
        case .August:    return 8
        case .September: return 9
        case .October:   return 10
        case .November:  return 11
        case .December:  return 12
        }
    }
    
    /**
     Returns the name of month in year
     
     - parameter short: the short name of the month in year (short means 3rd letters)
     
     - returns: a Month representing month's name or nil if no match value was found
     */
    static func shortToLongMonth(_ short: String) -> Month? {
        switch short {
        case "Jan": return .January
        case "Feb": return .February
        case "Mar": return .March
        case "Apr": return .April
        case "May": return .May
        case "Jun": return .June
        case "Jul": return .July
        case "Aug": return .August
        case "Sep": return .September
        case "Oct": return .October
        case "Nov": return .November
        case "Dec": return .December
        default:    return nil
        }
    }
    
    /**
     Returns the name of day in week
     
     - parameter val: the index of the day in week (0 = Monday, 6 = Sunday)
     
     - returns: a WeekDay representing day's name or nil if 0 > val or 6 < val
     */
    static func weekDayFromInt(_ val: Int) -> WeekDay? {
        switch val {
        case 0:  return .Monday
        case 1:  return .Tuesday
        case 2:  return .Wednesday
        case 3:  return .Thursday
        case 4:  return .Friday
        case 5:  return .Saturday
        case 6:  return .Sunday
        default: return nil
        }
    }
}
