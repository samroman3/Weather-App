//
//  ViewController.swift
//  weatherApp
//
//  Created by Sam Roman on 10/9/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Variables & Outlets
    
    var forecast: Weather? {
        didSet {
            cityLabel.text = forecast?.fixedName
            forecastCollection.reloadData()
        }
    }
    
    var recentZIP = ""
    
    @IBOutlet weak var enterZIpLabel: UILabel!
    
    
    @IBOutlet weak var zipField: UITextField!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var forecastCollection: UICollectionView!
    
    //MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        forecastCollection.delegate = self
        forecastCollection.dataSource = self
        loadForecast(lat: 37.8267, long: -122.4233)
        zipField.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    //MARK: Private Data Methods
    
    private func loadForecast(lat: Double, long: Double){
        WeatherAPIClient.shared.getWeatherFrom(lat: lat, long: long) { (result) in
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
    
    private func loadData(zip: String){
        ZipCodeHelper.getLatLong(fromZipCode: zip) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                    self.enterZIpLabel.text = "Invalid ZIP, Try Again:"
                case .success(let lat, let long):
                    self.loadForecast(lat: lat, long: long)
                    self.enterZIpLabel.text = "Enter Zipcode:"
                    
                   
                }
            }
        }
    }

}



    //MARK: CollectionView Extension

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
        cell.summaryLabel.text = weather?.summary
        cell.dateLabel.text = "\(weather?.time ?? 3)"
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 406, height: 395)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let weather = forecast?.daily?.data?[indexPath.row]
        let detailVC = ForecastDetailVC()
        detailVC.cityLabel.text = self.cityLabel.text
        detailVC.weather = weather
        self.modalPresentationStyle = .overCurrentContext
        present(detailVC, animated: true, completion: nil)
        
        
        
    }
}


    //MARK: TextField Extension
extension ViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if zipField.text?.count == 5 {
            zipField.resignFirstResponder()
            loadData(zip: zipField.text ?? "10940")
            
        return true
        } else {
        return false
        }
}

}

