//
//  User.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 20/5/23.
//

import Foundation

struct User:Codable {
    let fullname:String
    let email:String
    let uid:String
    var homeLocation:SavedLocation?
    var workLocation:SavedLocation?
    
}
