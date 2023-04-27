//
//  uberSwiftUITutorialApp.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 25/4/23.
//

import SwiftUI

@main
struct uberSwiftUITutorialApp: App {
    @StateObject var locationViewModel =  LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
