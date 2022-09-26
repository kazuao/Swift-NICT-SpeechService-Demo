//
//  APIRequestProtocol.swift
//  NICT-STT_TTS-Sample
//
//  Created by kazunori.aoki on 2022/09/09.
//

import Foundation

enum OtherError: Error {
    case HogeError
}

/// HTTP Request Method
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

// MARK: RestAPI Request Parameters Protocol
protocol RestAPIRequestProtocol {
    /// リクエストパラメータ
    associatedtype Request: Codable
    /// レスポンスパラメータ
    associatedtype Response: Codable

    /// Base URL
    var baseURL: String { get }
    /// Request Path
    var path: String { get }
    /// HTTP Request Method
    var method: HTTPMethod { get }
    /// HTTP Request Headers
    var headers: [String: String]? { get }
    /// HTTP Request Params
    var params: Request? { get }
    /// HTTP Request Query Items
    var queryItems: [URLQueryItem]? { get }
    /// HTTP Request Body
    var body: Data? { get }
}

extension RestAPIRequestProtocol {
    /// URLRequestの作成
    func buildURLRequest() throws -> URLRequest {

        guard let baseURL = URL(string: baseURL) else {
            throw OtherError.HogeError
        }

        let url = baseURL.appendingPathComponent(path)

        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        var urlRequest = URLRequest(url: url)

        if let queryItems = queryItems {
            components?.queryItems = queryItems
        }

        if params != nil, let params = try? JSONEncoder().encode(params) {
            urlRequest.httpBody = params
        }

        if let body = body {
            urlRequest.httpBody = body
        }

        urlRequest.url = components?.url
        urlRequest.httpMethod = method.rawValue

        if let headers = headers {
            for header in headers {
                urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
            }
        }

        return urlRequest
    }

    func response(from data: Data) throws -> Response {

        if Response.self is String.Type {
            return data.base64EncodedString() as! Response
        } else {
            return try JSONDecoder().decode(Response.self, from: data)
        }
    }
}
