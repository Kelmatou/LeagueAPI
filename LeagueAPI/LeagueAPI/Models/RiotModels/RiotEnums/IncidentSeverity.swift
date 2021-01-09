//
//  IncidentSeverity.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 1/9/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

public class IncidentSeverity {
    
    public enum SeverityLevel: String {
        case Info = "info"
        case Warning = "warning"
        case Critical = "critical"
        case Unknown = "unknown"
    }

    public private(set) var severity: SeverityLevel
    
    public init?(_ severity: SeverityLevel) {
        guard severity != .Unknown else {
            Logger.error("Cannot create Incident Severity object with .Unknown severity level")
            return nil
        }
        self.severity = severity
    }
    
    internal init(_ severity: String) {
        switch severity {
        case SeverityLevel.Info.rawValue:
            self.severity = .Info
        case SeverityLevel.Warning.rawValue:
            self.severity = .Warning
        case SeverityLevel.Critical.rawValue:
            self.severity = .Critical
        default:
            Logger.warning("Incident Severity \"\(severity)\" unknown (check for LeagueAPI update)")
            self.severity = .Unknown
        }
    }
}
