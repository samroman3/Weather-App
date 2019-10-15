//
//  FavoritesViewController.swift
//  weatherApp
//
//  Created by Sam Roman on 10/15/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    
    var favs = [FavPhotos]()
    
    
    @IBOutlet weak var favTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        favTableView.delegate = self
        favTableView.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}


extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
