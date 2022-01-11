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
            mapLayer
                .ignoresSafeArea()
            VStack(spacing: 0) {
                header
                Spacer()
                PreviewStack
            }
        }
        .sheet(item: $viewModel.sheetLocation) { location in
            DetailView(location: location)
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
    
    private var mapLayer: some View {
        Map(coordinateRegion: $viewModel.mapRegion,
            annotationItems: viewModel.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                MapAnnotationView()
                    .scaleEffect(viewModel.mapLocation == location ? 1.0 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        viewModel.showNextLocation(location: location)
                    }
            }
        })
    }
    
    private var PreviewStack: some View {
        ZStack {
            ForEach(viewModel.locations) { location in
                if viewModel.mapLocation == location {
                    PreviewView(location: location)
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading))
                        )
                }
            }
        }
    }
}
