//
//  HomeViewModel.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 15/11/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var products: [ProductModel] = []
    
    private let homeRepository: HomeRepositoryType = HomeRepository()
    
    func getAllProducts() async {
        let productsResult = await homeRepository.fromRemote.fetchProducts()
        switch productsResult {
        case .success(let response):
            guard let products = response.results, !products.isEmpty else {return}
            await MainActor.run {
                self.products = products
                debugPrint(products)
            }
        case .failure(let error):
            debugPrint(error.localizedDescription)
        }
    }
}
