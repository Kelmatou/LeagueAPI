//
//  DevicePlatform.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 1/9/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

public class DevicePlatform {
    
    public enum Platform: String, CustomStringConvertible {
        case Windows = "windows"
        case MacOS = "macos"
        case Android = "android"
        case iOS = "ios"
        case PS4 = "ps4"
        case XBone = "xbone"
        case Switch = "switch"
        case Unknown = "unknown"
        
        public var description: String {
            switch self {
            case .Windows:
                return "Windows"
            case .MacOS:
                return "MacOS"
            case .Android:
                return "Android"
            case .iOS:
                return "iOS"
            case .PS4:
                return "PS4"
            case .XBone:
                return "XBone"
            case .Switch:
                return "Switch"
            case .Unknown:
                return "Unknown"
            }
        }
    }

    public private(set) var platform: Platform
    
    public init?(_ platform: Platform) {
        guard platform != .Unknown else {
            Logger.error("Cannot create Device Platform object with .Unknown platform")
            return nil
        }
        self.platform = platform
    }
    
    internal init(_ platform: String) {
        switch platform {
        case Platform.Windows.rawValue:
            self.platform = .Windows
        case Platform.MacOS.rawValue:
            self.platform = .MacOS
        case Platform.Android.rawValue:
            self.platform = .Android
        case Platform.iOS.rawValue:
            self.platform = .iOS
        case Platform.PS4.rawValue:
            self.platform = .PS4
        case Platform.XBone.rawValue:
            self.platform = .XBone
        case Platform.Switch.rawValue:
            self.platform = .Switch
        default:
            Logger.warning("Device Platform \"\(platform)\" unknown (check for LeagueAPI update)")
            self.platform = .Unknown
        }
    }
}
