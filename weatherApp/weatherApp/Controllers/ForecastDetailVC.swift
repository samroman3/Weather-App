//
//  ForecastDetailVC.swift
//  weatherApp
//
//  Created by Sam Roman on 10/14/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class ForecastDetailVC: UIViewController {
    
    lazy var cityLabel: UILabel = {
    let label = UILabel()
        label.text = "City Name"
        label.textColor = .white
        label.font.withSize(17)
        return label
    }()
    
    private func constrainCityNameLabel(){
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            cityLabel.centerYAnchor.constraint(equalTo:self.view.centerYAnchor, constant: -200),
            cityLabel.heightAnchor.constraint(equalToConstant: CGFloat(10)),
            cityLabel.widthAnchor.constraint(equalToConstant: CGFloat(10))
        ])
    }
    
    private func addSubviews(){
        view.addSubview(cityLabel)
    }

    override func viewDidLoad() {
        addSubviews()
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
