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
    public static let LOL_API: String = "v4"
    public static let TFT_API: String = "v1"
    public static let RUNNETERA_API: String = "v1"
    public static let CLASH_API: String = "v1"
    public static let RIOT_API: String = "v1"
}
