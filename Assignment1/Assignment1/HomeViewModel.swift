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
    @Published var isLoading: Bool = false
    @Published var navigateToProductDetail: Bool = false
    @Published var showErrorAlert: Bool = false
    
    var errorMessage: String = ""
    private let homeRepository: HomeRepositoryType = HomeRepository()
    var selectedProduct: ProductModel?
    
    func selectedRowAndNavigateToDetail(_ product: ProductModel) {
        self.selectedProduct = product
        self.navigateToProductDetail.toggle()
    }
}

//MARK: -Network Calls

extension HomeViewModel {
    /// Fetches result of products from network.
    ///
    /// - Returns: Result type enum. ProductResponseModel returns in case of Success and AppError returns in case of Failure.
    ///
    func getAllProducts() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        let productsResult = await homeRepository.fromRemote.fetchProducts()
        switch productsResult {
        case .success(let response):
            guard let products = response.results, !products.isEmpty else {return}
            await MainActor.run {
                self.products = products
                self.isLoading = false
            }
        case .failure(let error):
            self.errorMessage = error.localizedDescription
            self.showErrorAlert.toggle()
        }
    }
}
