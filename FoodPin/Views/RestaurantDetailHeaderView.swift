//
//  RestaurantDetailHeaderView.swift
//  FoodPin
//
//  Created by Christopher Davis on 3/19/18.
//  Copyright © 2018 Social Pilot. All rights reserved.
//

import UIKit

class RestaurantDetailHeaderView: UIView {

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel! {
        didSet {
            typeLabel.layer.cornerRadius = 4
            typeLabel.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var heartImageView: UIImageView! {
        didSet {
            heartImageView.image = UIImage(named: "heart-tick")?.withRenderingMode(.alwaysTemplate)
            heartImageView.tintColor = .white
        }
    }
    @IBOutlet weak var ratingImageView: UIImageView!
    
// Closing Bracket
}
