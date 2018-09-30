//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by Andres Rambar on 6/15/18.
//  Copyright © 2018 Rambar. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var phoneCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
