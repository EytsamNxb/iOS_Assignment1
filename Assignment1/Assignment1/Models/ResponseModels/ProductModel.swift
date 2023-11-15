//
//  ProductModel.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 14/11/2023.
//

import Foundation

struct ProductResponseModel : Codable {
    let results : [ProductModel]?
    let pagination : Pagination?
    
    enum CodingKeys: String, CodingKey {
        
        case results = "results"
        case pagination = "pagination"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([ProductModel].self, forKey: .results)
        pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
    }
    
}


struct ProductModel : Codable, Hashable {
    let createdAt : String?
    let price : String?
    let name : String?
    let uid : String?
    let imageIDs : [String]?
    let imageUrls : [String]?
    let thumbnailUrls : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case createdAt = "created_at"
        case price = "price"
        case name = "name"
        case uid = "uid"
        case imageIDs = "image_ids"
        case imageUrls = "image_urls"
        case thumbnailUrls = "image_urls_thumbnails"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        uid = try values.decodeIfPresent(String.self, forKey: .uid)
        imageIDs = try values.decodeIfPresent([String].self, forKey: .imageIDs)
        imageUrls = try values.decodeIfPresent([String].self, forKey: .imageUrls)
        thumbnailUrls = try values.decodeIfPresent([String].self, forKey: .thumbnailUrls)
    }
    
}

struct Pagination : Codable {
    let key : String?
    enum CodingKeys: String, CodingKey {
        case key = "key"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
    }
    
}
