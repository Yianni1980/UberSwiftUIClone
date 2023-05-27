//
//  SettingsView.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 28/5/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            List{
                Section {
                    HStack {
                        Image("male-profile-photo")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 64,height: 64)
                        VStack(alignment: .leading,spacing:8) {
                            Text("Stephan Dowless")
                                .font(.system(size: 16,weight:.semibold))
                            Text("test@gmail.com")
                                .font(.system(size: 14))
                                .accentColor(Color.theme.primaryTextColor)
                                .opacity(0.77)
                        }
                        Spacer()
                        Image(systemName:"chevron.right")
                            .imageScale(.small)
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                }
                
                Section("Favorites") {
                    SavedLocationRowView(imageName: "house.circle.fill", title: "Home", subTitle: "Add Home")
                    SavedLocationRowView(imageName: "archivebox.circle.fill", title: "Work", subTitle: "Add Work")
                    
                }
                Section("Settings") {
                    SettingsRowView(imageName: "bell.circle.fill", title: "Notifications", tintColor: Color(.systemPurple))
                    SettingsRowView(imageName: "creditcard.circle.fill", title: "Payment Methods", tintColor: Color(.systemBlue))
                }
                Section("Account") {
                    SettingsRowView(imageName: "dollarsign.circle.fill", title: "Make Money Driving", tintColor: Color(.systemGreen))
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Payment Methods", tintColor: Color(.systemRed))
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
