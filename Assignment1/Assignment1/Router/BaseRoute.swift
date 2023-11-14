//
//  BaseRoute.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 14/11/2023.
//

import Foundation

enum HttpMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}

protocol BaseRoute {
    var path: String { get}
    var httpMethod: HttpMethod { get}
    var authHeaders: [String: String] { get }
}
