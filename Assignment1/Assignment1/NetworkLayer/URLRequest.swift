//
//  URLRequest.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 14/11/2023.
//

import Foundation

typealias RouterInput<T> = (body: T?, query: [String: String]?)

enum RequestType: Int {
    case json
    case formData
}

extension RequestType {
    var requestHeaders: [String: String] {
        var headers = [String: String]()
        switch self {
        case .json:
            headers["Content-Type"] = "application/json"
            headers["Accept"] = "application/json"
        case .formData:
            headers["Content-type"] = "multipart/form-data"
            headers["Accept"] = "application/json"
        }
        return headers
    }
}

protocol UrlRequest {
    func CreateURLRequest<T: Codable>(route: BaseRoute,requestType: RequestType, _ input: RouterInput<T>) throws -> URLRequest
}

extension UrlRequest {
    func CreateURLRequest<T: Codable>(route: BaseRoute, requestType: RequestType, _ input: RouterInput<T>) throws -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host =  AppEnvironment.baseURL
        components.path = route.path
        if let query = input.query {
            var queryItems = [URLQueryItem]()
            for (key, value) in query {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
            components.queryItems = queryItems
        }
        
        var urlRequest: URLRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = route.httpMethod.rawValue
        
        let requestTypeHeaders = requestType.requestHeaders
        for (key, value) in requestTypeHeaders {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        for (key, value) in route.authHeaders {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        if let params = input.body {
            urlRequest.httpBody = Data()
            do {
                let encoder = JSONEncoder()
                encoder.dateEncodingStrategy = .millisecondsSince1970
                urlRequest.httpBody = try encoder.encode(params)
            } catch {
                debugPrint("Error")
            }
        }

        return urlRequest
    }
}
