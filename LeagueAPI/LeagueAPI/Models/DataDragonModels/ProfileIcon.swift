//
//  ProfileIcon.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/17/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class ProfileIcon {
    
    public var id: ProfileIconId
    public var profileIcon: ImageWithUrl
    
    public init(id: ProfileIconId, profileIcon: ImageWithUrl) {
        self.id = id
        self.profileIcon = profileIcon
    }
    
    internal init(data: ProfileIconData, version: String) {
        self.id = data.id
        self.profileIcon = ImageWithUrl(url: "\(ServicesUrl.DDragonCdn)/\(version)/img/profileicon/\(data.id).png", image: nil)
    }
}
