//
//  FirstViewController.swift
//  CareShare
//
//  Created by K on 10/28/16.
//  Copyright © 2016 K. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Foundation

class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        
        addPerson()
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
//        let homelessData = HomelessData.people
//        
//        let location = CLLocationCoordinate2D(latitude: 34.0129592, longitude: -118.49519559999999)
//        
//        let span = MKCoordinateSpanMake(0.002, 0.002)
//        
//        let region = MKCoordinateRegion(center: location, span: span)
//        
//        mapView.setRegion(region, animated: true)
//        
//        let annotation = MKPointAnnotation()
//        
//        annotation.coordinate = location
//        
//        mapView.addAnnotation(annotation)
        
//        locationManager.stopUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Errors" + error.localizedDescription)
    }
    
    func addPerson() {
        var homelessData = HomelessData.people
        
        for index in homelessData {
            let latitude = index.coordinates.latitude
            
            let longitude = index.coordinates.longitude
            
            let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            
            let span = MKCoordinateSpanMake(0.2, 0.2)
            
            let region = MKCoordinateRegion(center: location, span: span)
            
            mapView.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = location
            
            mapView.addAnnotation(annotation)
        }
        
        print("this is the homeless data: \(homelessData)")
        
        
        
    }
    
    // Append Homeless people data
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

