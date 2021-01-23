//
//  MaintenanceStatus.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 1/9/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

public class MaintenanceStatus {
    
    public enum Status: String, CustomStringConvertible {
        case Scheduled = "scheduled"
        case InProgress = "in_progress"
        case Complete = "complete"
        case Unknown = "unknown"
        
        public var description: String {
            switch self {
            case .Scheduled:
                return "Scheduled"
            case .InProgress:
                return "In Progress"
            case .Complete:
                return "Complete"
            case .Unknown:
                return "Unknown"
            }
        }
    }

    public private(set) var status: Status
    
    public init?(_ status: Status) {
        guard status != .Unknown else {
            Logger.error("Cannot create Maintenance Status object with .Unknown status")
            return nil
        }
        self.status = status
    }
    
    internal init(_ status: String) {
        switch status {
        case Status.Scheduled.rawValue:
            self.status = .Scheduled
        case Status.InProgress.rawValue:
            self.status = .InProgress
        case Status.Complete.rawValue:
            self.status = .Complete
        default:
            Logger.warning("Maintenance Status \"\(status)\" unknown (check for LeagueAPI update)")
            self.status = .Unknown
        }
    }
}
