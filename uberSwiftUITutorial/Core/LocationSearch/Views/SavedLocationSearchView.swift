//
//  SavedLocationSearchView.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 30/5/23.
//

import SwiftUI

struct SavedLocationSearchView: View {
    @State private var text = ""
    @StateObject var viewModel = HomeViewModel()
    let config: savedLocationViewModel
    var body: some View {
        VStack{
                TextField("Search for a location..",text: $viewModel.queryFragment)
                    .frame(height: 32)
                    .padding(.leading)
                    .background(Color(.systemGray5))
                    .padding()
                
        
            Spacer()
            LocationSearchResultsView(viewModel: viewModel, config: .saveLocation(config))
            
        }
        .navigationTitle(config.subTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SavedLocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SavedLocationSearchView( config: .home)
        }
    }
}
