//
//  DeveloperPreview.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 1/6/23.
//

import Firebase
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    
    static let shared = DeveloperPreview()
    let mockUser = User(fullname: "Yanni Yiannakidi",
                        email:"test@test.com",
                        uid: NSUUID().uuidString,
                        coordinates: GeoPoint(latitude: 37.3, longitude: -122.05),
                        accountType: .passenger,
                        homeLocation:nil,
                        workLocation:nil)
}
