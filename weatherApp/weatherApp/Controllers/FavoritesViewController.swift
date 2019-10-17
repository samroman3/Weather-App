//
//  FavoritesViewController.swift
//  weatherApp
//
//  Created by Sam Roman on 10/15/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    
    //MARK: Variables & Outlets
    
    var favs = [FavPhotos]()
    {
        didSet {
            favTableView.reloadData()
        }
    }
    
    @IBOutlet weak var favTableView: UITableView!
    
    
    
    
    //MARK: Private Methods
    private func deleteObject(arr: [FavPhotos], index: Int){
           do {
               try PhotoPersistenceHelper.manager.delete(index: index)
               loadFavs()
           } catch {
               print("unable to delete")
           }
       }

    
    private func loadFavs(){
        do {
            let favArray = try PhotoPersistenceHelper.manager.getPhoto()
            self.favs = favArray
        } catch {
            return
        }
    }
    
    
    
    //MARK: Lifecycle Methods
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



    //MARK: Tableview Extension

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favTableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! FavoritesTableViewCell
        let fav = favs[indexPath.row]
        cell.cityLabel.text = fav.name
        cell.cityImage.image = UIImage(data: fav.image)
        cell.delegate = self as! FavDelegate
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
}


    //MARK: Actionsheet Delegate

extension FavoritesViewController: FavDelegate {
func showActionSheet(tag: Int) {
let optionsMenu = UIAlertController.init(title: "Options", message: "Make Selection", preferredStyle: .actionSheet)

let shareAction = UIAlertAction.init(title: "Share", style: .default) { (action) in
    let image = UIImage(data: self.favs[tag].image)

    let share = UIActivityViewController(activityItems: [image!], applicationActivities: [])
    self.present(share, animated: true, completion: nil)
}

let deleteAction = UIAlertAction.init(title: "Delete", style: .destructive) { (action) in
let pic = self.favs[tag]
print("deleting \(pic.name)")
do {
    try PhotoPersistenceHelper.manager.delete(index: tag)
    self.loadFavs()
} catch {
    return
}
}

let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
optionsMenu.addAction(shareAction)
optionsMenu.addAction(deleteAction)
optionsMenu.addAction(cancelAction)
present(optionsMenu,animated: true,completion: nil)


}

}
