//
//  NetworkManager.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 14/11/2023.
//

import Foundation

protocol NetworkManager {
    func request<T: Codable>(route: URLRequest) async throws ->  T
}

extension NetworkManager {
    func request<T: Codable>(route: URLRequest) async throws -> T {
        if let url = route.url?.absoluteString {
            debugPrint(url + " -> " + (String(data: route.httpBody ?? Data(), encoding: .utf8) ?? "Failed to Convert"))
        }
        
        guard let _ = route.url else {
            throw AppError.generalError()
        }
        
        let session = URLSession.shared
        let (data, response) = try await session.data(for: route)
        let httpResponse = response as? HTTPURLResponse
        if let statusCode =  httpResponse?.statusCode {
            switch statusCode {
            case 200...299:
                do {
                    let output = try JSONDecoder().decode(T.self, from: data)
                    return output
                } catch {
                   throw AppError(error: error.localizedDescription)
                }
            case 401:
                throw AppError.unauthorized()
            case 404:
                throw AppError.fileNotFound()
            case 500...599:
                throw AppError.serverError()
            default:
                throw AppError.generalError()
            }
        }
        throw AppError.generalError()
    }
}

