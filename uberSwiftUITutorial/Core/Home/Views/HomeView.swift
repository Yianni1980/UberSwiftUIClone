//
//  HomeView.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 25/4/23.
//

import SwiftUI
  
struct HomeView: View {
    @State private var mapState = MapViewState.noInput
    @State private var showSideMenu = false
    @EnvironmentObject var viewmodel: LocationSearchViewModel
    @EnvironmentObject var authViewmodel: AuthViewModel
    
    var body: some View {
        Group {
            if authViewmodel.userSession == nil {
              LoginView()
            } else if let user = authViewmodel.currentUser {
                NavigationStack {
                    ZStack {
                        if showSideMenu { 
                            SideMenuView(user: user)
                        }
                        
                        mapView
                            .offset(x: showSideMenu ? 316 : 0)
                            .shadow(color:showSideMenu ? .black : .clear,
                            radius: 10)
                    }
                    .onAppear{
                        showSideMenu = false
                        
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



extension HomeView {
    var mapView: some  View {
        ZStack(alignment: .bottom) {
            ZStack(alignment:.top) {
                UberMapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                
                if mapState == .searchingForLocation {
                    LocationSearchView()
                    
                } else if mapState == .noInput {
                    LocationSearchActivationView()
                        .padding(.top,72)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                mapState = .searchingForLocation
                                
                            }
                        }
                }
                
                MapViewActionButton(mapState:$mapState,showSideMenu: $showSideMenu)
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
        .onReceive(viewmodel.$selectedUberLocation) { location  in
            if location != nil {
                self.mapState = .locationSelected
            }
            
        }
    }
}
