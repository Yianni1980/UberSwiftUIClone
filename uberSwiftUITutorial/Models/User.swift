//
//  User.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 20/5/23.
//

import Firebase

enum AccountType:Int,Codable {
    case passenger
    case driver
}
struct User:Codable {
    let fullname:String
    let email:String
    let uid:String
    var coordinates:GeoPoint
    var accountType:AccountType
    var homeLocation:SavedLocation?
    var workLocation:SavedLocation?
    
}
