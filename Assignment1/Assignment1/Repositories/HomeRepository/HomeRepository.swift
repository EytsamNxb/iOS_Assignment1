//
//  HomeRepository.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 14/11/2023.
//

import Foundation

protocol HomeRepositoryType {
    var fromRemote: HomeRemoteRepositoryType {get}
   // var fromLocal: HomeLocalRepositoryType {get}
}

class HomeRepository: HomeRepositoryType {

}

extension HomeRepositoryType {
    var fromRemote: HomeRemoteRepositoryType {
        return HomeRemoteRepository()
    }

//    var fromLocal: HomeLocalRepositoryType {
//        return HomeLocalRepository()
//    }
}
