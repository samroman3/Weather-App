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
    {
        didSet {
            favTableView.reloadData()
        }
    }
    
    @IBOutlet weak var favTableView: UITableView!
    
    
    
    private func loadFavs(){
        do {
            let favArray = try PhotoPersistenceHelper.manager.getPhoto()
            self.favs = favArray
        } catch {
            return
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        favTableView.delegate = self
        favTableView.dataSource = self
        loadFavs()
        setNeedsStatusBarAppearanceUpdate()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadFavs()
    }
    
}


extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favTableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! FavoritesTableViewCell
        let fav = favs[indexPath.row]
        cell.cityLabel.text = fav.name
        cell.cityImage.image = UIImage(data: fav.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
}
