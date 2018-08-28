//
//  TournamentRegion.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/29/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class TournamentRegion {
    
    public private(set) var region: Region
    
    public init?(_ region: Region) {
        guard region != .KR else {
            Logger.error("Korean (KR) region cannot be selected for Tournament Region")
            return nil
        }
        self.region = region
    }
    
    internal init?(_ region: String) {
        switch region {
        case Region.BR.rawValue:
            self.region = .BR
        case Region.EUNE.rawValue:
            self.region = .EUNE
        case Region.EUW.rawValue:
            self.region = .EUW
        case Region.JP.rawValue:
            self.region = .JP
        case Region.KR.rawValue:
            // Korea is not a tournament region, but if Riot send us "KR", we should assume it is now
            self.region = .KR
        case Region.LAN.rawValue:
            self.region = .LAN
        case Region.LAS.rawValue:
            self.region = .LAS
        case Region.NA.rawValue:
            self.region = .NA
        case Region.OCE.rawValue:
            self.region = .OCE
        case Region.PBE.rawValue:
            self.region = .PBE
        case Region.RU.rawValue:
            self.region = .RU
        case Region.TR.rawValue:
            self.region = .TR
        default:
            Logger.warning("Region \"\(region)\" unknown (check for LeagueAPI update)")
            return nil
        }
    }
}
