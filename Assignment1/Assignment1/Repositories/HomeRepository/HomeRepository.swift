//
//  HomeRepository.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 14/11/2023.
//

import Foundation

protocol HomeRepositoryType {
    func fetchProducts() async throws -> [Product]
}

class HomeRepository: HomeRepositoryType {
    private let remoteRepository: HomeRemoteRepositoryType
    // private let localRepository: HomeLocalRepositoryType
    
    init(remoteRepository: HomeRemoteRepository) {
        self.remoteRepository = remoteRepository
    }
    
    func fetchProducts() async throws -> [Product] {
        let response = try await remoteRepository.fetchProductsFromRemote()
        guard let products = response.results, !products.isEmpty else {
            return []
        }
        var productsDTO: [Product] = []
        let _ = products.compactMap {productsDTO.append(Product(name: $0.name ?? "", price: $0.price ?? "", imageUrls: $0.imageUrls ?? [], thumbnailUrls: $0.thumbnailUrls ?? []))}
        return productsDTO
    }
    
}
