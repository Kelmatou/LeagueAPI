//
//  TournamentDetails.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class TournamentDetails: Decodable {
    
    public var id: Int
    public var tournamentCodeId: Int
    public var providerId: ProviderId
    public var name: String
    public var password: String
    public var code: TournamentCode
    public var teamSize: Int
    public var participantIds: [SummonerId]?
    public var spectatorType: SpectatorType
    public var pickType: PickType
    public var map: MapType
    public var region: TournamentRegion
    public var metadata: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "tournamentId"
        case tournamentCodeId = "id"
        case providerId = "providerId"
        case name = "lobbyName"
        case password = "password"
        case code = "code"
        case teamSize = "teamSize"
        case participantIds = "participants"
        case spectatorType = "spectators"
        case pickType = "pickType"
        case map = "map"
        case region = "region"
        case metadata = "metaData"
    }
    
    public init(id: Int, tournamentCodeId: Int, providerId: ProviderId, name: String, password: String, code: TournamentCode, teamSize: Int, participantIds: [SummonerId]?, spectatorType: SpectatorType, pickType: PickType, map: MapType, region: TournamentRegion, metadata: String?) {
        self.id = id
        self.tournamentCodeId = tournamentCodeId
        self.providerId = providerId
        self.name = name
        self.password = password
        self.code = code
        self.teamSize = teamSize
        self.participantIds = participantIds
        self.spectatorType = spectatorType
        self.pickType = pickType
        self.map = map
        self.region = region
        self.metadata = metadata
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.tournamentCodeId = try container.decode(Int.self, forKey: .tournamentCodeId)
        self.providerId = try ProviderId(container.decode(Int.self, forKey: .providerId))
        self.name = try container.decode(String.self, forKey: .name)
        self.password = try container.decode(String.self, forKey: .password)
        self.code = try TournamentCode(container.decode(String.self, forKey: .code))
        self.teamSize = try container.decode(Int.self, forKey: .teamSize)
        let participants: [String]? = try? container.decode([String].self, forKey: .participantIds)
        if let participants = participants {
            self.participantIds = participants.map { SummonerId($0) }
        }
        self.spectatorType = try SpectatorType(container.decode(String.self, forKey: .spectatorType))
        self.pickType = try PickType(container.decode(String.self, forKey: .pickType))
        self.map = try MapType(container.decode(String.self, forKey: .map))
        self.region = try TournamentRegion(container.decode(String.self, forKey: .region))!
        self.metadata = try container.decode(String.self, forKey: .metadata)
    }
}
