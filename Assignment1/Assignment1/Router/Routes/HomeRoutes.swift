//
//  HomeRoute.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 14/11/2023.
//

import Foundation

enum HomeRoutes: BaseRoute {
    var authHeaders: [String : String] { [:]}
    
    case getProducts
    
    var path: String {
        switch self {
        case .getProducts:
            return "/default/dynamodb-writer"
        }
    }
    var httpMethod: HttpMethod {
        switch self {
        case .getProducts:
            return .get
        }
    }
}
