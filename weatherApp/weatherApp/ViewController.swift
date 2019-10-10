//
//  ViewController.swift
//  weatherApp
//
//  Created by Sam Roman on 10/9/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var forecastCollection: UICollectionView!
    
    override func viewDidLoad() {
        forecastCollection.delegate = self
        forecastCollection.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}



