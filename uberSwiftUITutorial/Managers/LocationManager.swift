//
//  LocationManager.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 25/4/23.
//

import CoreLocation

class LocationManager:NSObject,ObservableObject {
     private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
}

extension LocationManager:CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard  !locations.isEmpty else {return}
        print(locations.first)
        locationManager.stopUpdatingLocation()
    }
    
}
