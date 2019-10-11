//
//  ViewController.swift
//  weatherApp
//
//  Created by Sam Roman on 10/9/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var forecast: Weather? {
        didSet {
            cityLabel.text = forecast?.timezone?.replacingOccurrences(of: "_", with: " ")
            forecastCollection.reloadData()
        }
    }
    
//    var searchLatLong: String? {
//        didSet {
//            loadForecast(str: searchLatLong!)
//
//        }
//    }
    
    
    @IBOutlet weak var zipField: UITextField!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var forecastCollection: UICollectionView!
    
    override func viewDidLoad() {
        forecastCollection.delegate = self
        forecastCollection.dataSource = self
        loadForecast(str:"37.8267,-122.4233")
        zipField.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    private func loadForecast(str: String){
        WeatherAPIClient.shared.getWeatherFrom(searchWord: str) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                    print("its me")
                case .success(let data):
                    self.forecast = data
                }
            }
        }
    }

}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecast?.daily?.data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = forecastCollection.dequeueReusableCell(withReuseIdentifier: "forecastCell", for: indexPath) as? ForecastCell else { return UICollectionViewCell()}
        let weather = forecast?.daily?.data?[indexPath.row]
//        cell.dateLabel.text = weather.currently.time
        cell.highLabel.text = "High: \( weather?.apparentTemperatureHigh ?? 0.0)"
        cell.lowLabel.text = "Low: \(weather?.apparentTemperatureLow ?? 0.0)"
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 270, height: 270)
    }
}

extension ViewController: UITextFieldDelegate {
    
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        var result = false
//        if zipField.text?.count == 5 {
//            ZipCodeHelper.getLatLong(fromZipCode: zipField.text ?? "") { (result) in
//                DispatchQueue.main.async {
//                switch result {
//                case .failure(let error):
//                    print(error)
//                case .success(let lat, let long):
//                    let str = "\(lat),\(long)"
//                    WeatherAPIClient.shared.getWeatherFrom(searchWord: str) { (result) in
//                        DispatchQueue.main.async {
//                            switch result {
//                            case .failure(let error):
//                                print(error)
//                            case .success(let data):
//                                self.forecast = data
//                            }
//                        }
//
//                    }
//                    }
//                }
//            }
//        result = true
//        } else {
//        result = false
//        }
//      return result
//    }

}

