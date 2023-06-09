//
//  LocationSearchRecultCell.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 27/4/23.
//

import SwiftUI

struct LocationSearchRecultCell: View {
    let title:String
    let subtitle:String
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .accentColor(.white)
                .frame(width: 40,height: 40)
            
            VStack(alignment: .leading,spacing: 4) {
                Text(title)
                    .font(.body)
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                Divider()

            }
            .padding(.leading,8)
            .padding(.vertical,8)
        }
        .padding(.leading)
    }
}

struct LocationSearchRecultCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchRecultCell(title: "starbucks", subtitle: "123 Main St")
    }
}
