//
//  LocationSearchResultsView.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 30/5/23.
//

import SwiftUI

struct LocationSearchResultsView: View {
    @StateObject var viewModel: HomeViewModel
    let config: LocationResultsViewConfig
    var body: some View {
        ScrollView {
            VStack(alignment:.leading) {
                ForEach(viewModel.results, id:\.self) { result in
                    LocationSearchRecultCell(title: result.title, subtitle: result.subtitle)
                        .onTapGesture {
                            withAnimation {
                                viewModel.selectLocation(result, config: config)
                     
                            }
                            
                            
                        }
                    
                    
                }
            }
        }
    }
}



