//
//  UIColor+Ext.swift
//  FoodPin
//
//  Created by Christopher Davis on 3/20/18.
//  Copyright © 2018 Social Pilot. All rights reserved.
//
import Foundation
import UIKit

// Make it easier to write the UIColor class without having to divide by 255.0
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let redValue = CGFloat(red) / 255.0
        let greenValue = CGFloat(green) / 255.0
        let blueValue = CGFloat(blue) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
}
