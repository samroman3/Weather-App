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
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var forecastCollection: UICollectionView!
    
    override func viewDidLoad() {
        forecastCollection.delegate = self
        forecastCollection.dataSource = self
        loadForecast()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    private func loadForecast(){
        WeatherAPIClient.shared.getWeatherFrom(searchWord: "") { (result) in
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
        return forecast?.daily?.data?.count ?? 1
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
    
}

