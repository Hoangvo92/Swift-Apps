//
//  ViewController.swift
//  Memorable Places Main
//
//  Created by Hoang Vo on 5/30/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
   
    var manager = CLLocationManager()
    
    var activePlace2 = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
        //-------------------------------------
        print(activePlace2)
        print(activePlace)
        if activePlace == -1 {
            
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        }
        else
        {
            if globalPlaces.count > activePlace {
                if let name = globalPlaces[activePlace]["name"] {
                    if let lat = globalPlaces[activePlace]["lat"] {
                        if let lon = globalPlaces[activePlace]["lon"]{
                            if let latitude = Double(lat) {
                                if let longitude = Double(lon){
                                    
                                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                    
                                    let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                    
                                    let region = MKCoordinateRegion(center: coordinates, span: span)
                                    
                                    self.map.setRegion(region, animated: true)
                                    
                                    let annotation = MKPointAnnotation()
                                    annotation.coordinate = coordinates
                                    annotation.title = name
                                    self.map.addAnnotation(annotation)
                                }
                            }
                        }
                    }
                }
                
            }
        }
    }
    
    @objc func longpress(gestureRecognizer: UIGestureRecognizer){
        if gestureRecognizer.state == UIGestureRecognizer.State.began{
            print("longpress")
            let touchPoint = gestureRecognizer.location(in: self.map)
            let new_coordinate = self.map.convert(touchPoint, toCoordinateFrom: self.map)
            //convert from CLLocationCoordinate2D to CLLocation for geocode
            let location = CLLocation(latitude: new_coordinate.latitude, longitude: new_coordinate.longitude)
            var title = ""
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                if error != nil {
                    print(error!)
                } else {
                    if let placemark = placemarks?[0]{
                        if placemark.subThoroughfare != nil {
                            title += placemark.subThoroughfare! + " "
                        }
                        
                        if placemark.thoroughfare != nil {
                            title += placemark.thoroughfare!
                        }
                    }
                }
                if title == "" {
                    title = "Added \(NSDate())"
                }
                let annotation = MKPointAnnotation()
                annotation.coordinate = new_coordinate
                annotation.title = title
                self.map.addAnnotation(annotation)
                globalPlaces.append(["name": title, "lat": "\(new_coordinate.latitude)", "lon": "\(new_coordinate.longitude)"])
                UserDefaults.standard.set(globalPlaces, forKey: "places")
            }
            )

        }

    }
    
    //to check location of user, adding places around user
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.map.setRegion(region, animated: true)
    }


}

