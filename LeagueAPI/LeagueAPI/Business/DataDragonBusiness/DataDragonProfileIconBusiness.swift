//
//  DataDragonProfileIconBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/17/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DataDragonProfileIconBusiness {
    
    public static func getProfileIconIds(completion: @escaping ([ProfileIconId]?, String?) -> Void) {
        DataDragonRequester.instance.getProfileIcons() { (profileIconFile, error) in
            completion(profileIconFile?.profileIcons.map { $0.id }, error)
        }
    }
    
    public static func getProfileIcon(by id: ProfileIconId, completion: @escaping (ProfileIcon?, String?) -> Void) {
        DataDragonRequester.instance.getProfileIcons() { (profileIconFile, error) in
            if let profileIconFile = profileIconFile {
                if let profileIcon = profileIconFile.profileIcons.first(where: { $0.id == id }) {
                    completion(profileIcon, nil)
                }
                else {
                    completion(nil, "Profile icon with id=\(id) not found.")
                }
            }
            else {
                completion(nil, error)
            }
        }
    }
}
