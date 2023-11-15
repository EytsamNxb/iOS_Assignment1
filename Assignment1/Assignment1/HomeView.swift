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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .task {
            await viewModel.getAllProducts()
        }
        .padding()
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
