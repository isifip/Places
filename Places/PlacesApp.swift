//
//  PlacesApp.swift
//  Places
//
//  Created by Irakli Sokhaneishvili on 11.01.22.
//

import SwiftUI

@main
struct PlacesApp: App {
    
    @StateObject private var viewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
