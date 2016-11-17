//
//  SecondViewController.swift
//  CareShare
//
//  Created by K on 10/28/16.
//  Copyright © 2016 K. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Foundation

class SecondViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet var tapOutlet: UITapGestureRecognizer!

    
    
    var longitude: CLLocationDegrees = 0
    var latitude: CLLocationDegrees = 0
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SecondViewController.dismissKeyboard))
       view.addGestureRecognizer(tap)
       
   
    }

  func dismissKeyboard() {
       //Causes the view (or one of its embedded text fields) to resign the first responder status.
       view.endEditing(true)
   }

    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations [0]
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        let latDelta: CLLocationDegrees = 0.05
        let longDelta: CLLocationDegrees = 0.05
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let theLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let theRegion = MKCoordinateRegion(center: theLocation, span:span)
        currentLocation = theLocation
        
        self.mapView.setRegion(theRegion, animated: true)
    }
    
    var currentLocation: CLLocationCoordinate2D?
    
    @IBAction func tapAction(_ sender: AnyObject) {
        
        let annotation = MKPointAnnotation()
        guard let current = currentLocation else { return }
        annotation.coordinate = current
        mapView.addAnnotation(annotation)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

