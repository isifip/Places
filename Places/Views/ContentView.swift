//
//  ContentView.swift
//  Places
//
//  Created by Irakli Sokhaneishvili on 11.01.22.
//

import SwiftUI



struct ContentView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.locations) {
                Text($0.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LocationsViewModel())
    }
}
