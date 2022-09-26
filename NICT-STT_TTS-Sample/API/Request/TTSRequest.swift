//
//  TTSRequest.swift
//  NICT-STT_TTS-Sample
//
//  Created by kazunori.aoki on 2022/09/09.
//

import Foundation

struct TTSRequest: RestAPIRequestProtocol {
    typealias Request = TTSRequestEntity
    typealias Response = String

    var token: String
    var request: Request

    var baseURL: String {
        return "https://tts.mimi.fd.ai"
    }

    var path: String {
        return "speech_synthesis"
    }

    var method: HTTPMethod {
        return .post
    }

    var headers: [String : String]? {
        return [
            "Authorization": "bearer \(token)",
            "Content-Type": "application/x-www-form-urlencoded",
        ]
    }

    var params: TTSRequestEntity? = nil

    var queryItems: [URLQueryItem]? = nil

    var body: Data? {
        return "text=\(request.text)&engine=\(request.engine)&lang=\(request.lang)".data(using: .utf8)
    }
}
