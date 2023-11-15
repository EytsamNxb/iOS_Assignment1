//
//  ContentView.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 14/11/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView().padding()
                } else {
                    ScrollView(showsIndicators: false) {
                        ForEach(viewModel.products, id: \.self) { product in
                            ProductRow(product: product)
                        }
                    }
                }
            }.navigationTitle("Products")
                .padding()
        }.ignoresSafeArea()
        .task {
            await viewModel.getAllProducts()
        }
        
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
