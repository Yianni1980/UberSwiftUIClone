//
//  SideMenuOptionView.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 21/5/23.
//

import SwiftUI

struct SideMenuOptionView: View {
    let viewModel: sideMenuOptionViewModel
    var body: some View {
        HStack(spacing:16) {
            Image(systemName:viewModel.imageName)
                .font(.title2)
                .imageScale(.medium)
            
            Text(viewModel.title)
                .font(.system(size: 16,weight: .semibold))
            Spacer()
        }
        .foregroundColor(Color.theme.primaryTextColor)
    }
}

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView(viewModel: .messages)
    }
}
