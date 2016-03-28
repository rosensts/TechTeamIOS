//
//  GeocodingVC.swift
//  TechTeamIOS
//
//  Created by Rosenstein on 3/1/16.
//  Copyright © 2016 Rosenstein. All rights reserved.
//

import UIKit
import MapKit

class GeocoderVC: UIViewController, MKMapViewDelegate {


    @IBOutlet weak var map: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    let locationManager = CLLocationManager()
    
    let address = "2036 Neil Ave, Columbus, OH 43210" // Address for Bolz Hall
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.delegate = self
        getPlacemarkFromAddress(address)
        
        // Do any additional setup after loading the view.
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            map.showsUserLocation = true // Display user location on the map
        } else {
            locationManager.requestWhenInUseAuthorization() // Display pop-up that asks user for use of location
        }
    }
    
    /*
    param: location
    current user's location
    */
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2, regionRadius * 2)
        map.setRegion(coordinateRegion, animated: true)
        
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        if let loc = userLocation.location {
            centerMapOnLocation(loc)
        }
    }
    
    // Turn location into annotation
    func createAnnotationForLocation(location: CLLocation) {
        let ann = MapAnnotation(coordinate: location.coordinate)
        centerMapOnLocation(location)
        map.addAnnotation(ann)
    }
    
    func getPlacemarkFromAddress(address: String) {
        CLGeocoder().geocodeAddressString(address) { (placemarks, error ) -> Void in
            
            if let marks = placemarks where marks.count > 0 {
                if let loc = marks[0].location {
                    // we have a valid location with coordinates
                    self.createAnnotationForLocation(loc)
                }
            }
        }
    }
    
    // Edit pindrop before dropping on map
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {

        // User blinking blue is also an annotation. Thus only change appearance of desired kind of annotation
        if annotation.isKindOfClass(MapAnnotation) {
            let annoView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Default")
            annoView.pinTintColor = UIColor.yellowColor()
            annoView.animatesDrop = true
            return annoView
        }
        return nil
        
    }


}
