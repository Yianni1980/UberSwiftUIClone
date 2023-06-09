//
//  SideMenuView.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 21/5/23.
//

import SwiftUI

struct SideMenuView: View {
    private let user:User
    init(user:User) {
        self.user  = user
    }
    
    var body: some View {
        
            VStack(spacing:40){
                //Header View
                VStack(alignment:.leading,spacing:32) {
                    //user info
                    HeaderView(user: user)
                    //become a driver
                    VStack(alignment:.leading, spacing:16) {
                        Text("Do more with your account ")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Image(systemName: "dollarsign.square")
                                .font(.title2)
                                .imageScale(.medium)
                            Text("Make Money Driving")
                                .font(.system(size: 16,weight: .semibold))
                                .padding(6)
                            
                        }
                        
                    }
                    Rectangle()
                        .frame(width: 296,height:0.75)
                        .opacity(0.7)
                        .foregroundColor(.gray)
                        .shadow(color:.black.opacity(0.7),radius: 4)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,16)
                //option list
                
                VStack {
                    ForEach(sideMenuOptionViewModel.allCases) { viewModel in
                        NavigationLink(value: viewModel) {
                            SideMenuOptionView(viewModel: viewModel)
                                .padding()
                        }
                        
                        
                    }
                }
                .navigationDestination(for: sideMenuOptionViewModel.self) { viewModel in
                    switch viewModel {
                    case .trips:
                        Text("Trips")
                    case .wallet:
                        Text("Wallet")
                    case .settings :
                        SettingsView(user: user)
                    case .messages :
                        Text("Messages")
                    }
                }
                Spacer()
                
            }
            .padding(.top,32)
        }
    }


struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(user: dev.mockUser)
    }
}
