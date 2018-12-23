//
//  LocalAssets.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 12/23/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class LocalAssets {
    
    public static func getAssetData(filename: String) -> Data? {
        let leagueAPIBundle: Bundle = Bundle(for: LeagueAPI.self)
        guard let ressourceUrl = leagueAPIBundle.url(forResource: filename, withExtension: nil) else { return nil }
        do {
            return try Data(contentsOf: ressourceUrl)
        }
        catch {
            Logger.error("Failed to extract data from local ressource \(filename): \(error)")
            return nil
        }
    }
}
