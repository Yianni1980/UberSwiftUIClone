//
//  Color.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 11/5/23.
//

import SwiftUI


extension  Color {
    static let theme = ColorTheme()
}
struct ColorTheme {
    let backgroundColor = Color("BackgroundColor")
    let secondaryBackgroundColor = Color("SecondaryBackgroundColor")
    let primaryTextColor = Color("PrimaryTextColor")
}
