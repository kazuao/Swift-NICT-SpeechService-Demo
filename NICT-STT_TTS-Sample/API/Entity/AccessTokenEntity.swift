//
//  AccessTokenEntity.swift
//  NICT-STT_TTS-Sample
//
//  Created by kazunori.aoki on 2022/09/09.
//

import Foundation

struct AccessTokenRequestEntity: Codable {
    var grant_type: String
    var client_id: String
    var client_secret: String
    var scope: String
}

struct AccessTokenResponseEntity: Codable {
    var operationId: String
    var startTimestamp: Int
    var selfLink: String
    var progress: Int
    var code: Int
    var kind: String
    var endTimestamp: Int
    var status: String
    var error: String
    var targetLink: String
    var accessToken: String
    var expires_in: Int
}
