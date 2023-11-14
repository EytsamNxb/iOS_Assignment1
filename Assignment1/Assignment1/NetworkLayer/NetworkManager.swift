//
//  NetworkManager.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 14/11/2023.
//

import Foundation

protocol NetworkManager {
    func request<T: Codable>(route: URLRequest) async throws -> Result<T, Error>
}

extension NetworkManager {
    func request<T: Codable>(route: URLRequest) async throws -> Result<T, Error> {
        if let url = route.url?.absoluteString {
            debugPrint(url + " -> " + (String(data: route.httpBody ?? Data(), encoding: .utf8) ?? "Failed to Convert"))
        }
        
        guard let _ = route.url else {
            return .failure(AppError.generalError())
        }
        
        let session = URLSession.shared
        let (data, response) = try await session.data(for: route)
        let httpResponse = response as? HTTPURLResponse
        if let statusCode =  httpResponse?.statusCode {
            switch statusCode {
            case 200...299:
                do {
                    let output = try JSONDecoder().decode(T.self, from: data)
                    return .success(output)
                } catch {
                    return .failure(AppError(error: error.localizedDescription))
                }
            case 401:
                return .failure(AppError.unauthorized())
            case 404:
                return .failure(AppError.fileNotFound())
            case 500...599:
                return .failure(AppError.serverError())
            default:
                return .failure(AppError.generalError())
            }
        }
        return .failure(AppError.generalError())
    }
}

