//
//  ViewController.swift
//  maps1
//
//  Created by Hoang Vo on 5/29/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let latitude: CLLocationDegrees = 27.175244
        let longitude: CLLocationDegrees = 8.039
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
        map.setRegion(region, animated: true)
        //add annotations to map
        let annotation = MKPointAnnotation()
        annotation.title = "Taj Mahal"
        annotation.subtitle = "One day I will visit"
        annotation.coordinate = coordinates
        
        map.addAnnotation(annotation)
        //add long press gesture recognizer
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:))) //this is a function, there is a : after longpress to send signal
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
    }

    //this function is to support longpress in annotation
    @objc func longpress(gestureRecognizer: UIGestureRecognizer){
        let touchPoint = gestureRecognizer.location(in: self.map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New place"
        annotation.subtitle = "Maybe I'll go here too..."
        map.addAnnotation(annotation)
        
    }

}

