//
//  SettingsView.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 28/5/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    private let user:User
    init(user:User) {
        self.user  = user
    }
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
                            Text(user.fullname)
                                .font(.system(size: 16,weight:.semibold))
                            Text(user.email)
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
                    .padding(8)
                }
                
                Section("Favorites") {
                    ForEach(savedLocationViewModel.allCases) { viewModel  in
                        NavigationLink {
                            SavedLocationSearchView(config:viewModel)
                        } label: {
                            SavedLocationRowView(viewModel: viewModel, user: user)
                        }

                        
                    }
                    
                   
                    
                }
                Section("Settings") {
                    SettingsRowView(imageName: "bell.circle.fill", title: "Notifications", tintColor: Color(.systemPurple))
                    SettingsRowView(imageName: "creditcard.circle.fill", title: "Payment Methods", tintColor: Color(.systemBlue))
                }
                Section("Account") {
                    SettingsRowView(imageName: "dollarsign.circle.fill", title: "Make Money Driving", tintColor: Color(.systemGreen))
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color(.systemRed))
                        .onTapGesture {
                            viewModel.signOut()
                        }
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView(user: User(fullname: "John doe", email: "johndoe@gmail.com", uid: "1331311313"))
                .environmentObject(AuthViewModel())
        }
    }
}
