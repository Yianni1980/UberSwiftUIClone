//
//  SavedLocationRowView.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 28/5/23.
//

import SwiftUI

struct SavedLocationRowView: View {
    let viewModel:savedLocationViewModel
    var body: some View {
        HStack(spacing:12) {
            Image(systemName:viewModel.imageName )
                .imageScale(.medium)
                .font(.title)
                .foregroundColor(Color(.systemBlue))
            
            VStack(alignment: .leading,spacing:4) {
                Text(viewModel.title)
                    .font(.system(size: 15,weight: .semibold))
                    .foregroundColor(Color.theme.primaryTextColor)
                
                Text(viewModel.subTitle)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)

            }
        }
    }
}

struct SavedLocationRowView_Previews: PreviewProvider {
    static var previews: some View {
        SavedLocationRowView(viewModel: .home)
    }
}
