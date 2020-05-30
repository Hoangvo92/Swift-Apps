//
//  ViewController.swift
//  finding user location
//
//  Created by Hoang Vo on 5/30/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit
import CoreLocation // to find location of user
import MapKit //for mapview and show map on phone

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
//CLLocationManagerDelegate for CLLocationManager(), MKMapViewDelegate for  MKMapView
    @IBOutlet weak var mapView: MKMapView!
    
    var location_manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        location_manager.delegate = self
        location_manager.desiredAccuracy = kCLLocationAccuracyBest
        location_manager.requestWhenInUseAuthorization()
        location_manager.startUpdatingLocation()
        mapView.delegate = self
        
        
        
    }


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      
        let user_location: CLLocation = locations[0]
        let latitude = user_location.coordinate.latitude
        let longitude = user_location.coordinate.longitude
        
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
        self.mapView.setRegion(region, animated: true)
    }
}

//finding user location -> build phrase -> link binary with libraries -> search for corelocation
//in info.plist-> right click and choose Add Row -> NSLocationWhenInUseUsageDescription
//in info.plist-> right click and choose Add Row -> NSLocationAlwaysUsageDescription
