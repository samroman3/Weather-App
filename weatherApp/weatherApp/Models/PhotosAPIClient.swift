//
//  PhotosAPIClient.swift
//  weatherApp
//
//  Created by Sam Roman on 10/15/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import Foundation

struct PhotoAPIClient {
    private init() {}
    static let shared = PhotoAPIClient()
    
    func getPhotos(search: String, completionHandler: @escaping (Result<Photos, AppError>) -> ()) {
        let name = search.replacingOccurrences(of: " ", with: "+").lowercased()
        let urlStr = "https://pixabay.com/api/?key=\(Secrets.pix_key)&q=\(name)&image_type=photo&pretty=true"
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(AppError.badURL))
            return
        }
        NetworkManager.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(.other(rawError: error)))
            case .success(let data):
                
                do {
                    let photos = try Photos.getPhotos(data: data)
                    completionHandler(.success(photos))
                }
                catch {
                    completionHandler(.failure(.other(rawError: error)))
                }
            }
        }
    }
    
}
