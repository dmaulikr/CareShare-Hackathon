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
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    var currentLocation: CLLocationCoordinate2D
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations [0]
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        let latDelta: CLLocationDegrees = 0.05
        let longDelta: CLLocationDegrees = 0.05
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let theLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let theRegion = MKCoordinateRegion(center: theLocation, span:span)
        currentLatitude = Double(latitude)
        currentLongitude = Double(longitude)
        
        self.mapView.setRegion(theRegion, animated: true)
//        latitude = theLocation.latitude
//        longitude = theLocation.longitude
    }
    
    
    
    @IBAction func tapAction(_ sender: AnyObject) {
        
        
        let currentLocation = CLLocationCoordinate2D(latitude: currentLongitude, longitude: currentLatitude)
        let annotation = MKPointAnnotation()
        annotation.coordinate = theLocation
        mapView.addAnnotation(annotation)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

