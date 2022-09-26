//
//  AccessTokenRequest.swift
//  NICT-STT_TTS-Sample
//
//  Created by kazunori.aoki on 2022/09/09.
//

import Foundation

struct AccessTokenRequest: RestAPIRequestProtocol {
    typealias Request = AccessTokenRequestEntity
    typealias Response = AccessTokenResponseEntity

    var baseURL: String {
        return "https://auth.mimi.fd.ai"
    }

    var path: String {
        return "v2/token"
    }

    var method: HTTPMethod {
        return .post
    }

    var headers: [String : String]? = nil

    var params: AccessTokenRequestEntity? = nil

    var queryItems: [URLQueryItem]? {
        return [
            .init(name: "grant_type", value: "https://auth.mimi.fd.ai/grant_type/client_credentials"),
            .init(name: "client_id", value: "\(Config.appId):\(Config.clientId)"),
            .init(name: "client_secret", value: Config.secretKey),
            .init(name: "scope", value: "https://apis.mimi.fd.ai/auth/nict-asr/http-api-service;https://apis.mimi.fd.ai/auth/nict-tts/http-api-service;https://apis.mimi.fd.ai/auth/nict-tra/http-api-service"),
        ]
    }

    var body: Data? = nil
}
