//
//  SavedLocation.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 30/5/23.
//


import Firebase
struct SavedLocation:Codable {
    let title:String
    let address:String
    let coordinates: GeoPoint
}
