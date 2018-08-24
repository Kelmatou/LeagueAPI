//
//  ChampionPassive.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/24/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class ChampionPassive {
    
    public var name: String
    public var description: String
    public var image: ImageWithUrl

    public init(name: String, description: String, image: ImageWithUrl) {
        self.name = name
        self.description = description
        self.image = image
    }
    
    internal init(data: ChampionPassiveData, version: String) {
        self.name = data.name
        self.description = data.description
        self.image = ImageWithUrl(url: "\(ServicesUrl.DDragonCdn)/\(version)/img/passive/\(data.imageName)", image: nil)
    }
}
