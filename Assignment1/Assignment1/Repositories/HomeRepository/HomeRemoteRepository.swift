//
//  HomeRemoteRepository.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 14/11/2023.
//

import Foundation

protocol HomeRemoteRepositoryType {
    func fetchProducts() async -> Result<ProductResponseModel, Error>
}

class HomeRemoteRepository: HomeRemoteRepositoryType, NetworkManager, UrlRequest {
    func fetchProducts() async -> Result<ProductResponseModel, Error> {
        let routerInput: RouterInput<Int> = (nil, nil)
        do {
            let urlRequest = try CreateURLRequest(route: HomeRoutes.getProducts, requestType: .json, routerInput)
            return try await request(route: urlRequest)
        } catch {
            return .failure(AppError(error: error.localizedDescription))
        }
    }
}

class HomeMockRemoteRepository: HomeRemoteRepositoryType {
    func fetchProducts() async -> Result<ProductResponseModel, Error> {
        let productResponse: ProductResponseModel = Helper.load("MockJSON.json")
        return .success(productResponse)
    }
}
