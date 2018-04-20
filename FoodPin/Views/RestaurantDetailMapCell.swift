//
//  RestaurantDetailMapCell.swift
//  FoodPin
//
//  Created by Christopher Davis on 4/16/18.
//  Copyright © 2018 Social Pilot. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {
    
    
    // MARK: - Outlets
    @IBOutlet var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    // MARK: - FUNCTIONS
    
    // Define the location and add an annotation to the map on the detail view.
    func configure(location: String) {
        
        // Get the location
        let geoCoder = CLGeocoder()
        print(location)
        
        geoCoder.geocodeAddressString(location, completionHandler: {
            placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let placemarks = placemarks {
                
                // Get the first placemark
                let placemark = placemarks[0]
                
                // Add the annotation at the placemark
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location {
                    // Display the annotation
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    // Set the Zoom level
                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 150, 150)
                    self.mapView.setRegion(region, animated: false)
                }
            }
        })
    }
    
    

}
