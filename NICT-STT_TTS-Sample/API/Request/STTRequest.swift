//
//  STTRequest.swift
//  NICT-STT_TTS-Sample
//
//  Created by kazunori.aoki on 2022/09/09.
//

import Foundation

struct STTRequest: RestAPIRequestProtocol {
    typealias Request = String
    typealias Response = STTEntity

    var token: String

    var baseURL: String {
        return "https://service.mimi.fd.ai"
    }

    var path: String {
        return ""
    }

    var method: HTTPMethod {
        return .post
    }

    var headers: [String : String]? {
        return [
            "Content-Type": "audio/x-pcm;bit=16;rate=16000;channels=1",
            "x-mimi-process": "nict-asr",
            "x-mimi-input-language": "ja",
            "x-mimi-nict-asr-options": "response_format=v2;progressive=false",
            "Authorization": "bearer \(token)",
        ]
    }

    var params: String? = nil

    var queryItems: [URLQueryItem]? = nil

    var body: Data? {
        let data = FileHelper.audioFile
        return data
    }
}
