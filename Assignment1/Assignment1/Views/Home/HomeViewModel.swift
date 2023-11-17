//
//  HomeViewModel.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 15/11/2023.
//

import Foundation
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var navigateToProductDetail: Bool = false
    @Published var showErrorAlert: Bool = false
    
    var errorMessage: String = ""
    private let homeRepository: HomeRepositoryType = HomeRepository(remoteRepository: HomeRemoteRepository())
    var selectedProduct: Product?
    
    func selectedRowAndNavigateToDetail(_ product: Product) {
        self.selectedProduct = product
        self.navigateToProductDetail.toggle()
    }
    
    func dismissErrorAlert() {
        self.showErrorAlert = false
    }
}

//MARK: -Network Calls

extension HomeViewModel {
    /// Fetches result of products from network.
    ///
    /// - Returns: Result type enum. ProductResponseModel returns in case of Success and AppError returns in case of Failure.
    ///
    func getAllProducts() async {
        self.isLoading = true
        do {
            let products = try await homeRepository.fetchProducts()
            self.products = products
            self.isLoading = false
        } catch {
            self.errorMessage = error.localizedDescription
            self.showErrorAlert = true
        }
    }
}
