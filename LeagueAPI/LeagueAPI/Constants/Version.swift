//
//  Version.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/27/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Version {
    
    public static let LeagueAPI: String = "v\(Bundle(for: Version.self).infoDictionary!["CFBundleShortVersionString"] ?? "Unknown")"
    public static let RiotAPI: String = "v4"
}
