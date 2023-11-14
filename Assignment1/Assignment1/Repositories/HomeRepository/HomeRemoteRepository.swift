//
//  HomeRemoteRepository.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 14/11/2023.
//

import Foundation

protocol HomeRemoteRepositoryType {
    func fetchProducts() async -> ProductResponseModel
}



