//
//  UINavigationController+Ext.swift
//  FoodPin
//
//  Created by Christopher Davis on 3/20/18.
//  Copyright © 2018 Social Pilot. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    open override var childViewControllerForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
