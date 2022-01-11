//
//  ContentView.swift
//  Places
//
//  Created by Irakli Sokhaneishvili on 11.01.22.
//

import SwiftUI
import MapKit


struct ContentView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion)
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LocationsViewModel())
    }
}
