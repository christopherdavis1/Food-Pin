//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Christopher Davis on 3/19/18.
//  Copyright © 2018 Social Pilot. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//  MARK: - Actions
    @IBAction func closeEmojiReview(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    // Send the emoji rating image to the header view
    @IBAction func rateRestaurant(segue: UIStoryboardSegue) {
        
        // Once the emoji rating overlay is dismissed...
        dismiss(animated: true, completion: {
            
            // Take the selected rating identifier's image and...
            if let rating = segue.identifier {
                self.restaurant.rating = rating
                self.headerView.ratingImageView.image = UIImage(named: rating)
            }
        let scaleTransform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
        
        self.headerView.ratingImageView.transform = scaleTransform
        self.headerView.ratingImageView.alpha = 0
        
        // Scale it up and change the opacity from 0 to 1
        UIView.animate(withDuration: 0.4, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.7, options: [], animations: {
            self.headerView.ratingImageView.transform = .identity
            self.headerView.ratingImageView.alpha = 1
            }, completion: nil)
        })
    }
    
    
    
    
//  MARK: - Outlets
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RestaurantDetailHeaderView!
    
    
//  MARK: - Variables
    var restaurant: Restaurant = Restaurant()
    
    
//  MARK: - Load content into the view from the Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        
        // Pass data to the content in the header
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.headerImageView.image = UIImage(named: restaurant.image)
        headerView.heartImageView.isHidden = (restaurant.isVisited) ? false : true
        
        // Style the header bar
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.tintColor = .white
    }

    
//    UNCOMMENT TO HIDE THE NAV ON SCROLL
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Header Styles
        navigationController?.navigationBar.tintColor = .white
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            cell.iconImageView.image = UIImage(named: "phone")
            cell.shortTextLabel.text = restaurant.phone
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            cell.iconImageView.image = UIImage(named: "map")
            cell.shortTextLabel.text = restaurant.location
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
            cell.descriptionLabel.text = restaurant.description
            
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailSeparatorCell.self), for: indexPath) as! RestaurantDetailSeparatorCell
            cell.titleLabel.text = "HOW TO GET HERE"
            
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
            cell.configure(location: restaurant.location)
            
            return cell
            
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller.")
        }
    }

    
//  If the user clicks on the map, pass the restaurant's details to that map.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destinationController = segue.destination as! MapViewController
            destinationController.restaurant = restaurant
        
        } else if segue.identifier == "showReview" {
            let destinationController = segue.destination as! ReviewViewController
            destinationController.restaurant = restaurant
            
        }
    }
    
    

// MARK: - CLOSING BRACKET
}

