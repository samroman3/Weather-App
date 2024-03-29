//
//  Photos.swift
//  weatherApp
//
//  Created by Sam Roman on 10/15/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//


import Foundation

// MARK: - Photos
struct Photos: Codable {
    let totalHits: Int?
    let hits: [Hit]?
    let total: Int?
     
    static func getPhotos(data: Data) throws -> Photos {
    
     try JSONDecoder().decode(Photos.self, from: data)
}
    
}

// MARK: - Hit
struct Hit: Codable {
    let largeImageURL: String?
    let webformatHeight, webformatWidth, likes, imageWidth: Int?
    let id, userID, views, comments: Int?
    let pageURL: String?
    let imageHeight: Int?
    let webformatURL: String?
    let type: TypeEnum?
    let previewHeight: Int?
    let tags: String?
    let downloads: Int?
    let user: String?
    let favorites, imageSize, previewWidth: Int?
    let userImageURL: String?
    let previewURL: String?

    enum CodingKeys: String, CodingKey {
        case largeImageURL, webformatHeight, webformatWidth, likes, imageWidth, id
        case userID = "user_id"
        case views, comments, pageURL, imageHeight, webformatURL, type, previewHeight, tags, downloads, user, favorites, imageSize, previewWidth, userImageURL, previewURL
    }
}

enum TypeEnum: String, Codable {
    case photo = "photo"
}
    

