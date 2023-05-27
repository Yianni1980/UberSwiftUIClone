//
//  SavedLocationRowView.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 28/5/23.
//

import SwiftUI

struct SavedLocationRowView: View {
    let imageName:String
    let title:String
    let subTitle:String
    var body: some View {
        HStack(spacing:12) {
            Image(systemName:imageName )
                .imageScale(.medium)
                .font(.title)
                .foregroundColor(Color(.systemBlue))
            
            VStack(alignment: .leading,spacing:4) {
                Text(title)
                    .font(.system(size: 15,weight: .semibold))
                    .foregroundColor(Color.theme.primaryTextColor)
                
                Text(subTitle)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)

            }
        }
    }
}

struct SavedLocationRowView_Previews: PreviewProvider {
    static var previews: some View {
        SavedLocationRowView(imageName: "house.circle.fill", title: "Home", subTitle: "Add Home")
    }
}
