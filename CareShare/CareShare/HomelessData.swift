//
//  HomelessData.swift
//  CareShare
//
//  Created by K on 10/28/16.
//  Copyright © 2016 K. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

//var homelessDataArray: [HomelessData] = []

struct HomelessData {
    
    let name: String
    let location: String
    let coordinates: CLLocationCoordinate2D
    
    static let people: [HomelessData] = [
        
        HomelessData(name: "Ralp", location: "1520 2nd St, Santa Monica, CA 90401, USA", coordinates: CLLocationCoordinate2D(latitude: 34.0129592, longitude: -118.49519559999999)),
        HomelessData(name: "Jenny", location: "425 Broadway, Santa Monica, CA 90401, USA", coordinates: CLLocationCoordinate2D(latitude: 34.01574388540625, longitude: -118.49317073822021)),
        HomelessData(name: "Gertrude", location: "1351 3rd Street Promenade, Santa Monica, CA 90401, USA", coordinates: CLLocationCoordinate2D(latitude: 34.01673989100637, longitude: -118.4961748123169)),
        HomelessData(name: "Sally", location: "221 Santa Monica Blvd, Santa Monica, CA 90401, USA", coordinates: CLLocationCoordinate2D(latitude: 34.01538816628851, longitude: -118.49677562713623))
    ]

    
//    static func fromjson(dictionary: NSDictionary) -> HomelessData? {
//        guard let name = dictionary["name"] as? String,
//            let location = dictionary["location"] as? String,
//            let coordinates = dictionary["coordinates"] as? NSDictionary else {
//                print("Guard failed on fromJson()")
//                return nil
//        }
//        
//        guard let coordinatesDictionary = dictionary["coordinates"] as? NSDictionary else { return nil }
//        
//        guard let latitude = coordinatesDictionary["latitude"] as? CLLocationDegrees else { return nil }
//        
//        guard let longitude = coordinatesDictionary["longitude"] as? CLLocationDegrees else { return nil }
//        
//        let coordinatesObject = CLLocationCoordinate2D(latitude: latitude , longitude: longitude)
//        
//        return HomelessData(name: name, location: location, coordinates: coordinatesObject)
//    }

}





