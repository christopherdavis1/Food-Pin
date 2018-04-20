//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Christopher Davis on 4/20/18.
//  Copyright © 2018 Social Pilot. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var rateButtons: [UIButton]!
    @IBOutlet var closeButton: UIButton!
    
    // MARK: - Variables
    var restaurant = Restaurant()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Pass in the restaurant's image.
        backgroundImageView.image = UIImage(named: restaurant.image)
        
        // Apply the blur effect to the background image.
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        // Move all of the buttons 600pt to the left, so they'll fade in right.
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        
        // Make the buttons invisible to prep for animating opacity
        for rateButton in rateButtons {
            rateButton.transform = moveScaleTransform
            rateButton.alpha = 0
        }
        
        closeButton.transform = moveScaleTransform
        closeButton.alpha = 0
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // The function to increase the rate button's opacity when the view loads.
        // Animate each item at a time, after a half-second delay between items.
        UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: [], animations: {
            self.rateButtons[0].alpha = 1.0
            self.rateButtons[0].transform = .identity
        }, completion: nil)
        UIView.animate(withDuration: 0.4, delay: 0.15, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5,  options: [], animations: {
            self.rateButtons[1].alpha = 1.0
            self.rateButtons[1].transform = .identity
        }, completion: nil)
        UIView.animate(withDuration: 0.4, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5,  options: [], animations: {
            self.rateButtons[2].alpha = 1.0
            self.rateButtons[2].transform = .identity
        }, completion: nil)
        UIView.animate(withDuration: 0.4, delay: 0.25, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5,  options: [], animations: {
            self.rateButtons[3].alpha = 1.0
            self.rateButtons[3].transform = .identity
        }, completion: nil)
        UIView.animate(withDuration: 0.4, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5,  options: [], animations: {
            self.rateButtons[4].alpha = 1.0
            self.rateButtons[4].transform = .identity
        }, completion: nil)
        UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: [], animations: {
            self.closeButton.alpha = 1
            self.closeButton.transform = .identity
        }, completion: nil)
    }

    
// Closing Bracket
}
