//
//  HomeRemoteRepository.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 14/11/2023.
//

import Foundation

protocol HomeRemoteRepositoryType {
    func fetchProductsFromRemote() async throws -> Result<ProductResponseModel, Error>
}

class HomeRemoteRepository: HomeRemoteRepositoryType, NetworkManager, UrlRequest {
    func fetchProductsFromRemote() async throws -> Result<ProductResponseModel, Error> {
        let routerInput: RouterInput<Int> = (nil, nil)
        let urlRequest = try CreateURLRequest(route: HomeRoutes.getProducts, requestType: .json, routerInput)
        return try await request(route: urlRequest)
    }
}
