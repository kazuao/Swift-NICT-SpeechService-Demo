//
//  ViewModel.swift
//  NICT-STT_TTS-Sample
//
//  Created by kazunori.aoki on 2022/09/09.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var sttText: String = ""

    private let client = APIClient()

    func requestSTT() async throws {

        let accessToken = try await requestAccessToken()

        let request = STTRequest(token: accessToken)
        let urlRequest = try request.buildURLRequest()
        let response = try await client.request(urlRequest: urlRequest)
        let decode = try request.response(from: response)

        DispatchQueue.main.async {
            self.sttText = decode.response.first?.result ?? ""
        }
    }

    func requestTTS() async throws {
        let accessToken = try await requestAccessToken()

        let param = TTSRequestEntity(text: "こんにちは、ありがとう、さようなら", engine: "nict", lang: "ja")

        let request = TTSRequest(token: accessToken, request: param)
        let urlRequest = try request.buildURLRequest()
        let response = try await client.request(urlRequest: urlRequest)
        SpeechService.shared.speech(audioContent: response)
    }

    private func requestAccessToken() async throws -> String {
        let request = AccessTokenRequest()
        let urlRequest = try request.buildURLRequest()
        let response = try await client.request(urlRequest: urlRequest)
        let decode = try request.response(from: response)
        return decode.accessToken
    }
}
