//
//  AppError.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 14/11/2023.
//

import Foundation

public struct AppError: Codable,Error {
    let error : String
    let isNetworkError: Bool
    let isWifiError: Bool
    let fileNotFoundError: Bool
    let forbiddenError: Bool
    
    static func generalError() -> AppError {
        return AppError(error: "Something went wrong. Please try again later.")
    }
    
    static func serializationError() -> AppError {
        return AppError(error: "Response Serialization Error. Please contact provider.")
    }
    
    
    static func serverError() -> AppError {
        return AppError(error: "We are working really hard to make user experience better. There's work under progress. Please try again later.")
    }
    
    static func forbiddenError() -> AppError {
        return AppError(error: "Failed to authenticate token.")
    }
    
    static func wifiError()-> AppError {
        return AppError(error: "Please Check your Internet connection.", isNetworkError: false, isWifiError: true)
    }
    
    static func fileNotFound()-> AppError {
        return AppError(error: "File Not Found", isNetworkError: false, isWifiError: true, isFileNotFound: true)
    }
    
    static func unauthorized()-> AppError {
        return AppError(error: "Failed to authorized", isNetworkError: false, isWifiError: true, isFileNotFound: false)
    }
    
    init(error: String) {
        self.error = error
        self.isNetworkError = false
        self.isWifiError = false
        self.fileNotFoundError = false
        self.forbiddenError = false
    }
    
    init(error: String, isNetworkError: Bool, isWifiError: Bool, isFileNotFound: Bool = false, forbiddenError: Bool = false) {
        self.error = error
        self.isNetworkError = isNetworkError
        self.isWifiError = isWifiError
        self.fileNotFoundError = isFileNotFound
        self.forbiddenError = forbiddenError
    }
    
}

extension AppError {
    private enum CodingKeys: String, CodingKey {
        case error = "Error"
        case isNetworkError = "Network"
        case isWifiError = "Wifi"
        case fileNotFoundError = "fileError"
        case forbiddenError = "forbiddenError"
    }
}
