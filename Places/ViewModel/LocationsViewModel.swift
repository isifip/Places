//
//  LocationsViewModel.swift
//  Places
//
//  Created by Irakli Sokhaneishvili on 11.01.22.
//

import Foundation
import MapKit

class LocationsViewModel: ObservableObject {
    // All Locations
    @Published var locations: [Location]
    // Current Location
    @Published var mapLocation: Location {
        didSet {
            // When current location changes,
            // This updates mapRegion automatically.
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first! // <- forcing because data is hard coded
        self.updateMapRegion(location: mapLocation)
    }
    
    private func updateMapRegion(location: Location) {
        mapRegion = MKCoordinateRegion(
            center: location.coordinates,
            span: mapSpan
        )
    }
}
