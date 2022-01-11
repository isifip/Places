//
//  LocationsViewModel.swift
//  Places
//
//  Created by Irakli Sokhaneishvili on 11.01.22.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
