//
//  Assignment1App.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 14/11/2023.
//

import SwiftUI

@main
struct Assignment1App: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
