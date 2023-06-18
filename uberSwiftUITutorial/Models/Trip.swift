//
//  Trip.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 18/6/23.
//

import Firebase

struct Trip: Identifiable,Codable {
    let id:String
    let passengerUid:String
    let driverUid:String
    let passengerName:String
    let driverName:String
    let passengerLocation:GeoPoint
    let driverCoordinates:GeoPoint
    let pickLocationName:String
    let dropoffLocationName:String
    let pickupLocationAddress:String
    let pickLocation:GeoPoint
    let dropoffLocation:GeoPoint
    let tripCost:Double
}
