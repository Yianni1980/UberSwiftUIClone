//
//  LocationSearchViewModel.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 27/4/23.
//

import Foundation
import MapKit

enum LocationResultsViewConfig {
    case ride
    case saveLocation
}

class LocationSearchViewModel:NSObject,ObservableObject {
    
    //MARK: - Properties
    
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedUberLocation:uberLocation?
    @Published var pickupTime:String?
    @Published var dropOffTime:String?
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment:String = "" {
        didSet {
            searchCompleter.queryFragment = queryFragment
        }
    }

    var userLocation: CLLocationCoordinate2D?
    
    //MARK: Lifecycle
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    //MARK: Helpers
    
    func selectLocation(_ localSearch:MKLocalSearchCompletion,config:LocationResultsViewConfig) {
        switch config {
            
        case .ride:
            locationSearch(forlocalSearchCompletion: localSearch) { response, error in
                if let error = error {
                    print("DEBUG: :Location search failed with error \(error.localizedDescription)")
                    return
                }
                guard let item = response?.mapItems.first else {return}
                let coordinate = item.placemark.coordinate
                self.selectedUberLocation = uberLocation(title: localSearch.title, coordinate: coordinate)
                print("DEBUG: Location coordinates \(coordinate)")
            }
        case .saveLocation:
            print("DEBUG: Saved location here..")
        }
        
        
    }
    
    
    func locationSearch(forlocalSearchCompletion localSearch:MKLocalSearchCompletion,
                        completion:@escaping MKLocalSearch.CompletionHandler) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        search.start(completionHandler: completion)
        
    }
    
    func computRidePrice (forType type:RideType)->Double {
        guard let destCoordinate = selectedUberLocation?.coordinate else {return 0.0}
        guard let userCoordinate = self.userLocation else {return 0.0}
        
        let userLocation  = CLLocation(latitude: userCoordinate.latitude, longitude: userCoordinate.longitude)
        
        let destination = CLLocation(latitude: destCoordinate.latitude, longitude: destCoordinate.longitude)
        
        let tripDistanceInMeters = userLocation.distance(from: destination)
        
        return type.computePrice(for: tripDistanceInMeters)
        
    }
    func getDestinationRoute (from  userLocation:CLLocationCoordinate2D,to destination:CLLocationCoordinate2D,completion:@escaping (MKRoute) ->Void ) {
        
        let userPlacemark = MKPlacemark(coordinate: userLocation)
        let destPlacemark = MKPlacemark(coordinate: destination)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlacemark)
        request.destination = MKMapItem(placemark: destPlacemark)
        let directions = MKDirections(request: request)
        
        directions.calculate { responce, error in
            if let error = error {
                print("BEBUG: Failed to get directions with error\(error.localizedDescription)")
                return
            }
            
            guard let route = responce?.routes.first else {return}
            self.configurePickupAndDropoffTimes(with: route.expectedTravelTime)
            completion(route)
        }
    }
    
    func configurePickupAndDropoffTimes(with expectedTravelTime:Double) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        pickupTime = formatter.string(from: Date())
        dropOffTime = formatter.string(from: Date() + expectedTravelTime)
    }
    
}
extension LocationSearchViewModel:MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
