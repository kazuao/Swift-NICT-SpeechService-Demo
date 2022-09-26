//
//  APIClient.swift
//  NICT-STT_TTS-Sample
//
//  Created by kazunori.aoki on 2022/09/09.
//

import Foundation

final class APIClient {
    
    func request(urlRequest: URLRequest) async throws -> Data {
        async let (data, _) = URLSession.shared.data(for: urlRequest)
        return try await data
    }
}

struct DebugUtil {
    static func printData(message: String = "", data: Data) {
        print("\(message): ", String(describing: try! JSONSerialization.jsonObject(with: data, options: .allowFragments)))
    }
}
