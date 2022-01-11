//
//  PreviewView.swift
//  Places
//
//  Created by Irakli Sokhaneishvili on 11.01.22.
//

import SwiftUI

struct PreviewView: View {
    
    @EnvironmentObject var viewModel: LocationsViewModel
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 70)
                
        )
        .cornerRadius(10)
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            PreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }
        .environmentObject(LocationsViewModel())
    }
}

extension PreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(.white)
        .cornerRadius(16)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title3)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            viewModel.sheetLocation = location
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 120, height: 34)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button {
            viewModel.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 120, height: 34)
        }
        .buttonStyle(.bordered)
    }
}
