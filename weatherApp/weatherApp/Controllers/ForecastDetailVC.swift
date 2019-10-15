//
//  ForecastDetailVC.swift
//  weatherApp
//
//  Created by Sam Roman on 10/14/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class ForecastDetailVC: UIViewController {
    
    var weather: DailyDatum!
    
    lazy var cityLabel: UILabel = {
    let label = UILabel()
        label.text = "City Name"
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(17)
        return label
    }()
    
    lazy var highLabel: UILabel = {
    let label = UILabel()
        label.text = "High: "
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(14)
        return label
    }()
    
    lazy var lowLabel: UILabel = {
    let label = UILabel()
        label.text = "Low: "
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(14)
        return label
    }()
    
    lazy var sunsetLabel: UILabel = {
    let label = UILabel()
        label.text = "Sunset: "
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(14)
        return label
    }()
    
    lazy var sunriseLabel: UILabel = {
    let label = UILabel()
        label.text = "Sunrise: "
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(14)
        return label
    }()
    
    lazy var weatherIcon: UIImageView = {
      let icon = UIImageView()
        icon.backgroundColor = .lightGray
        icon.image = (UIImage(named: ""))
        return icon
    }()
    
    lazy var windSpeedLabel: UILabel = {
    let label = UILabel()
        label.text = "Windspeed: "
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(14)
        return label
    }()
    
    lazy var precipLabel: UILabel = {
    let label = UILabel()
        label.text = "Level of precipitation: "
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(14)
        return label
    }()
    
    lazy var infoStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews:[highLabel, lowLabel, sunriseLabel, sunsetLabel, precipLabel])
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = CGFloat(9)
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.backgroundColor = UIColor(white: 0, alpha: 0.98)
        button.imageView?.image = UIImage(systemName: "chevron.down.circle" )
        return button
    }()
    
    private func constrainCityNameLabel(){
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            cityLabel.centerYAnchor.constraint(equalTo:self.view.centerYAnchor, constant: -260),
            cityLabel.heightAnchor.constraint(equalToConstant: CGFloat(100)),
            cityLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0)
        ])
    }
    
    private func constrainStack(){
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            infoStack.centerYAnchor.constraint(equalTo:self.view.centerYAnchor, constant: 100),
            infoStack.heightAnchor.constraint(equalToConstant: CGFloat(100)),
            infoStack.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0)
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
    
    private func addSubviews(){
        view.addSubview(cityLabel)
        view.addSubview(backButton)
        view.addSubview(infoStack)
    }
    
    private func setConstraints(){
        constrainCityNameLabel()
        constrainBackButton()
        constrainStack()
    }

    override func viewDidLoad() {
        addSubviews()
        setConstraints()
        self.view.backgroundColor = UIColor(red: 0, green: 0.3, blue: 0.6, alpha: 0.99)
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
