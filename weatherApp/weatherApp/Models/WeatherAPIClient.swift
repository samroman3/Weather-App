//
//  WeatherAPIClient.swift
//  weatherApp
//
//  Created by Sam Roman on 10/10/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import Foundation

struct WeatherAPIClient {
    private init() {}
    static let shared = WeatherAPIClient()
    
    func getWeatherFrom(lat: Double, long: Double, completionHandler: @escaping (Result<Weather, AppError>) -> ()) {
        let urlStr = "https://api.darksky.net/forecast/\(Secrets.api_key)/\(lat),\(long)"
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
                let forecast = try Weather.getForecastFromData(data: data)
                    completionHandler(.success(forecast!))
                }
                catch {
                    completionHandler(.failure(.other(rawError: error)))
                }
            }
        }
    }
    
}
