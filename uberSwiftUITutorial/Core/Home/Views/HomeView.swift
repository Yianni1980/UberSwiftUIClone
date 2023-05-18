//
//  HomeView.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 25/4/23.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState = MapViewState.noInput
    @EnvironmentObject var viewmodel: LocationSearchViewModel
    @EnvironmentObject var authViewmodel: AuthViewModel

    var body: some View {
        Group {
            if authViewmodel.userSession == nil {
                LoginView()
            } else {
                ZStack(alignment: .bottom) {
                    ZStack(alignment:.top) {
                        UberMapViewRepresentable(mapState: $mapState)
                            .ignoresSafeArea()
                        
                        if mapState == .searchingForLocation {
                            LocationSearchView(mapState:$mapState)
                            
                        } else if mapState == .noInput {
                            LocationSearchActivationView()
                                .padding(.top,72)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        mapState = .searchingForLocation
                                        
                                    }
                                }
                            
                            
                        }
                        
                        MapViewActionButton(mapState:$mapState)
                            .padding(.leading)
                            .padding(.top,4)
                    }
                    
                    if mapState  == .locationSelected || mapState == .polylineAdded {
                        RideRequestView()
                            .transition(.move(edge: .bottom))
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
                .onReceive(LocationManager.shared.$userLocation) { location in
                    if let location = location{
                        viewmodel.userLocation = location
                    }
            }
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LocationSearchViewModel())
            .environmentObject(AuthViewModel())

    }
}
