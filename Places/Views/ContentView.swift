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
            VStack(spacing: 0) {
                header
                Spacer()
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

extension ContentView {
    private var header: some View {
        VStack {
            Button {
                viewModel.toggleLocationsList()
            } label: {
                Text("\(viewModel.mapLocation.name), \(viewModel.mapLocation.cityName)")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: viewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: viewModel.showLocationsList ? 180 : 0))
                    }
            }


            if viewModel.showLocationsList {
                ListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
        .padding()
    }
}
