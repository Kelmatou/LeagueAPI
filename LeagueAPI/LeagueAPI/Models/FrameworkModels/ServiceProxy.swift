//
//  ServiceProxy.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ServiceProxy {
    
    public private(set) var region: Region
    public private(set) var platforms: [Platform]
    public private(set) var host: String
    
    private init(region: Region, platforms: [Platform], host: String) {
        self.region = region
        self.platforms = platforms
        self.host = host
    }
    
    public convenience init(for region: Region) {
        switch region {
        case .BR:
            self.init(region: region, platforms: [.BR1], host: "br1.api.riotgames.com")
        case .EUNE:
            self.init(region: region, platforms: [.EUN1], host: "eun1.api.riotgames.com")
        case .EUW:
            self.init(region: region, platforms: [.EUW1], host: "euw1.api.riotgames.com")
        case .JP:
            self.init(region: region, platforms: [.JP1], host: "jp1.api.riotgames.com")
        case .KR:
            self.init(region: region, platforms: [.KR], host: "kr.api.riotgames.com")
        case .LAN:
            self.init(region: region, platforms: [.LA1], host: "la1.api.riotgames.com")
        case .LAS:
            self.init(region: region, platforms: [.LA2], host: "la2.api.riotgames.com")
        case .NA:
            self.init(region: region, platforms: [.NA1, .NA], host: "na1.api.riotgames.com")
        case .OCE:
            self.init(region: region, platforms: [.OC1], host: "oc1.api.riotgames.com")
        case .PBE:
            self.init(region: region, platforms: [.PBE1], host: "pbe1.api.riotgames.com")
        case .RU:
            self.init(region: region, platforms: [.RU], host: "ru.api.riotgames.com")
        case .TR:
            self.init(region: region, platforms: [.TR1], host: "tr1.api.riotgames.com")
        }
    }    
}
