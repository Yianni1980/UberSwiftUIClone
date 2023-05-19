//
//  MapViewActionButton.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 27/4/23.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState : MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        Button {
            withAnimation(.spring()) {
                actionForState(mapState)
            }
        } label: {
            Image(systemName:imageNameForState(mapState) )
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color:.black  ,radius: 6)
        }
        .frame(maxWidth:.infinity,alignment: .leading)
    }
    func actionForState(_ state:MapViewState) {
        switch state {
            
        case .noInput:
            authViewModel.signOut()
        case .locationSelected,.polylineAdded:
            mapState = .noInput
            viewModel.selectedUberLocation = nil

        case .searchingForLocation:
            mapState = .noInput
       
            
        }
    }
    func imageNameForState(_ state: MapViewState)->String {
        switch state {
            
        case .noInput:
            return "line.3.horizontal"
        case .locationSelected,.searchingForLocation,.polylineAdded:
           return "arrow.left"
            
        default:
            return "line.3.horizontal"

        }
    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(mapState:.constant(.noInput))
            .environmentObject(LocationSearchViewModel())
            .environmentObject(AuthViewModel())
    }
}
