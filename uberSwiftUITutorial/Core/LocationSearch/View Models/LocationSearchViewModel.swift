//
//  LocationSearchViewModel.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 27/4/23.
//

import Foundation
import MapKit

class LocationSearchViewModel:NSObject,ObservableObject {
    
    //MARK: - Properties
    
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedLocation:String?
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment:String = "" {
        didSet {
            searchCompleter.queryFragment = queryFragment
        }
    }

    //MARK: Lifecycle
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    //MARK: Helpers
    
    func selectLocation(_ Location:String) {
        self.selectedLocation = Location
        
        print("DEBUG:Selected location is \(self.selectedLocation) ")
    }
    
}
extension LocationSearchViewModel:MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
