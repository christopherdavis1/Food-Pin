//
//  RestaurantDetailTextCell.swift
//  FoodPin
//
//  Created by Christopher Davis on 3/20/18.
//  Copyright © 2018 Social Pilot. All rights reserved.
//

import UIKit

class RestaurantDetailTextCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
