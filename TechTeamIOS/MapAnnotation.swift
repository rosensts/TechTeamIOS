//
//  MapAnnotation.swift
//  TechTeamIOS
//
//  Created by Rosenstein on 3/3/16.
//  Copyright © 2016 Rosenstein. All rights reserved.
//
import Foundation
import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    var coordinate = CLLocationCoordinate2D()
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
