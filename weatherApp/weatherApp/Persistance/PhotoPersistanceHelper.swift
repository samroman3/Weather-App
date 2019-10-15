//
//  PhotoPersistanceHelper.swift
//  weatherApp
//
//  Created by Sam Roman on 10/15/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import Foundation

struct PhotoPersistenceHelper {
    
    private static var pictures = [FavPhotos]()
    
    static let manager = PhotoPersistenceHelper()

    func save(newPhoto: FavPhotos) throws {
        try persistenceHelper.save(newElement: newPhoto)
    }

    func getPhoto() throws -> [FavPhotos] {
        return try persistenceHelper.getObjects()
    }
    
    
    //TODO: find way to delete picture based on sender tag in collectionview cell
    func delete(picArray: [FavPhotos], index: Int) throws {
        return try persistenceHelper.deleteAtIndex(newArray: picArray, index: index)
        
}

    
    private let persistenceHelper = PersistenceHelper<FavPhotos>(fileName: "weatherPhotos.plist")

    private init() {}
}
