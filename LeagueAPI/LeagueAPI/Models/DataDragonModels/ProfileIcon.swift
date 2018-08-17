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
    
    public init(id: ProfileIconId, url: String, image: UIImage?) {
        self.id = id
        self.profileIcon = ImageWithUrl(url: url, image: image)
    }
    
    internal init(id: ProfileIconId, version: String) {
        self.id = id
        self.profileIcon = ImageWithUrl(url: "\(ServicesUrl.DDragonCdn)/\(version)/img/profileicon/\(id).png", image: nil)
    }
}
