//
//  SavedLocationSearchView.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 30/5/23.
//

import SwiftUI

struct SavedLocationSearchView: View {
    @State private var text = ""
    @StateObject var viewModel = LocationSearchViewModel()
    var body: some View {
        VStack{
            HStack(spacing:16) {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .imageScale(.medium)
                
                TextField("Search for a location..",text: $viewModel.queryFragment)
                    .frame(height: 32)
                    .padding(.leading)
                    .background(Color(.systemGray5))
                    .padding(.trailing)
                
                
            }
            .padding(.top)
            Spacer()
            LocationSearchResultsView(viewModel: viewModel, config: .saveLocation)
            
        }
        .navigationTitle("Add Home")
    }
}

struct SavedLocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SavedLocationSearchView()
        }
    }
}
