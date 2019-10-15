//
//  FavoritesTableViewCell.swift
//  weatherApp
//
//  Created by Sam Roman on 10/15/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    
    weak var delegate: FavDelegate?

    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var cityImage: UIImageView!
    
    
    @IBAction func optionAction(_ sender: UIButton) {
        delegate?.showActionSheet(tag: sender.tag)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
