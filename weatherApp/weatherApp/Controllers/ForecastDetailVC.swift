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
    }
    
    private func setConstraints(){
        constrainCityNameLabel()
        constrainBackButton()
    }

    override func viewDidLoad() {
        addSubviews()
        setConstraints()
        self.view.backgroundColor = UIColor(red: 0, green: 0.3, blue: 0.6, alpha: 0.99)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
