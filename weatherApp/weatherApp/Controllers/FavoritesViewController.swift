//
//  FavoritesViewController.swift
//  weatherApp
//
//  Created by Sam Roman on 10/15/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}


extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
