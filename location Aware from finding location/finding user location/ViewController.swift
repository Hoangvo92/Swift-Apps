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

    
    @IBOutlet weak var latitude_label: UILabel!
    
    @IBOutlet weak var longitude_label: UILabel!
    
    @IBOutlet weak var course_label: UILabel!
    
    @IBOutlet weak var speed_label: UILabel!
    @IBOutlet weak var altitude_label: UILabel!
    
    @IBOutlet weak var Address_label: UILabel!
    
    @IBOutlet weak var state_label: UILabel!
    
    @IBOutlet weak var postalCode_label: UILabel!
    
    @IBOutlet weak var country_label: UILabel!
    
    
    
    var location_manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        location_manager.delegate = self
        location_manager.desiredAccuracy = kCLLocationAccuracyBest
        location_manager.requestWhenInUseAuthorization()
        location_manager.startUpdatingLocation()
        //mapView.delegate = self
        
        
        
    }


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      
        let user_location: CLLocation = locations[0]
       // let latitude = user_location.coordinate.latitude
        latitude_label.text = String(user_location.coordinate.latitude)
        //let longitude = user_location.coordinate.longitude
        longitude_label.text = String(user_location.coordinate.longitude)
        course_label.text = String(user_location.course)
        speed_label.text = String(user_location.speed)
        altitude_label.text = String(user_location.altitude)
      //  let latDelta: CLLocationDegrees = 0.05
      //  let lonDelta: CLLocationDegrees = 0.05
      //  let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
      //  let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
     //   let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
     //   self.mapView.setRegion(region, animated: true)
        CLGeocoder().reverseGeocodeLocation(user_location) { (placemarks, error) in
            if error != nil {
                print(error!)
                
            }
            else {
                if let placemark = placemarks?[0]{
                    print(placemark)
                    var sub_throughfare = ""
                    if placemark.subThoroughfare != nil {
                        sub_throughfare = placemark.subThoroughfare!
                    }
                    
                    var throughfare = ""
                    if placemark.thoroughfare != nil {
                        throughfare = placemark.thoroughfare!
                    }
                    
                    var sublocality = ""
                    if placemark.subLocality != nil {
                        sublocality = placemark.subLocality!
                    }
                    
                    var postal_code = ""
                    if placemark.postalCode != nil {
                        postal_code = placemark.postalCode!
                    }
                    
                    var country = ""
                    if placemark.country != nil {
                        country = placemark.country!
                    }
                    self.Address_label.text = sub_throughfare + ", " + throughfare
                    self.postalCode_label.text = postal_code
                    self.country_label.text = country
                    self.state_label.text = sublocality
                    
                }
            }
        }
    }
}

//finding user location -> build phrase -> link binary with libraries -> search for corelocation
//in info.plist-> right click and choose Add Row -> NSLocationWhenInUseUsageDescription
//in info.plist-> right click and choose Add Row -> NSLocationAlwaysUsageDescription
