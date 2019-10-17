//
//  ForecastDetailVC.swift
//  weatherApp
//
//  Created by Sam Roman on 10/14/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class ForecastDetailVC: UIViewController {
    
    //MARK: Variables & Labels
    
    var photo = "not working"
    
    var weather: DailyDatum!
    
    
    lazy var cityLabel: UILabel = {
    let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(30)
        return label
    }()
    
    lazy var highLabel: UILabel = {
    let label = UILabel()
        label.text = "High: \(weather.apparentTemperatureHigh ?? 0) "
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(17)
        return label
    }()
    
    lazy var lowLabel: UILabel = {
    let label = UILabel()
        label.text = "Low: \(weather.apparentTemperatureLow ?? 0) "
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(17)
        return label
    }()
    
    lazy var sunsetLabel: UILabel = {
    let label = UILabel()
        label.text = "Sunset: \(weather.sunsetTime ?? 0)"
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(17)
        return label
    }()
    
    lazy var sunriseLabel: UILabel = {
    let label = UILabel()
        label.text = "Sunrise: \(weather.sunriseTime ?? 0) "
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(17)
        return label
    }()
    
    lazy var weatherIcon: UIImageView = {
      let icon = UIImageView()
        icon.backgroundColor = .lightGray
        return icon
    }()
    
    lazy var windSpeedLabel: UILabel = {
    let label = UILabel()
        label.text = "Windspeed: \(weather.windSpeed ?? 0) "
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(17)
        return label
    }()
    
    lazy var precipLabel: UILabel = {
    let label = UILabel()
        label.text = "Chance of precipitation: \(weather.precipProbability ?? 0)%"
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(17)
        return label
    }()
    
    
    //MARK: StackView 
    
    lazy var infoStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews:[cityLabel, highLabel, lowLabel, sunriseLabel, sunsetLabel, precipLabel])
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = CGFloat(2)
        stack.distribution = .equalSpacing
        return stack
    }()
    
    
    //MARK: Button Outlets
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.backgroundColor = UIColor.link
        button.addTarget(self, action: #selector(backButtonPressed(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save Photo To Favorites", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(white: 1, alpha: 0.98)
        button.addTarget(self, action: #selector(saveButtonPressed(sender:)), for: .touchUpInside)
        
        return button
    }()

    
    //MARK: Constraint Methods
    
    private func constrainStack(){
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            infoStack.centerYAnchor.constraint(equalTo:self.view.centerYAnchor, constant: 150),
            infoStack.heightAnchor.constraint(equalToConstant: 200),
            infoStack.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0)
        ])
    }
    
    private func constrainIcon(){
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherIcon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            weatherIcon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -190),
            weatherIcon.heightAnchor.constraint(equalToConstant: 365),
            weatherIcon.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }
    
    private func constrainBackButton(){
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0),
            backButton.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 0),
            backButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -400)
        ])
    }
    
    private func constrainSaveButton(){
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0),
            saveButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            saveButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 350)
        ])
    }
    
    
    //MARK: Objective C Methods
    
    @objc func backButtonPressed(sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func saveButtonPressed(sender: UIButton){
        let image = weatherIcon.image?.pngData()
        let fav = FavPhotos(image: image!, name: cityLabel.text!)
        do {
               try PhotoPersistenceHelper.manager.save(newPhoto: fav)
               dismiss(animated: true, completion: nil)
           } catch {
           return
       }
    }

    
    //MARK: Private Methods
    
    
    private func loadPhoto(name: String){
        PhotoAPIClient.shared.getPhotos(search: name) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let photos):
                    self.photo = photos.hits?[0].largeImageURL ?? ""
                    print(self.photo)
                    ImageHelper.shared.fetchImage(urlString: self.photo) { (result) in
                                DispatchQueue.main.async {
                                    switch result {
                                    case .success(let pic):
                                        self.weatherIcon.image = pic
                                    case .failure(let error):
                                        print(error)
                                        print(self.photo)
                    
                                    }
                                }
                            }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    private func addSubviews(){
        view.addSubview(cityLabel)
        view.addSubview(backButton)
        view.addSubview(infoStack)
        view.addSubview(weatherIcon)
        view.addSubview(saveButton)
    }
    
    private func setConstraints(){
        constrainBackButton()
        constrainStack()
        constrainIcon()
        constrainSaveButton()
    }
    
    
    
    
    
    //MARK: Lifecycle Methods
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        setNeedsStatusBarAppearanceUpdate()
        addSubviews()
        setConstraints()
        self.view.backgroundColor = UIColor(red: 0.31, green: 0.33, blue: 0.36, alpha: 1)
        loadPhoto(name: cityLabel.text!)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
