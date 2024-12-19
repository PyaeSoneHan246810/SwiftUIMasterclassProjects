//
//  AnimalMapView.swift
//  Africa
//
//  Created by Dylan on 05/12/2024.
//

import SwiftUI
import MapKit

struct AnimalMapView: View {
    // MARK: - PROPERTIES
    @State private var position: MapCameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 6.60,
                longitude: 16.44
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 60.0,
                longitudeDelta: 60.0
            )
        )
    )
    // MARK: - BODY
    var body: some View {
        Map(
            position: $position
        ).mapStyle(.standard)
            .overlay(alignment: .topTrailing) {
                NavigationLink {
                    MapView()
                } label: {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundStyle(.white)
                            .imageScale(.large)
                        Text("Locations")
                            .foregroundStyle(.accent)
                            .fontWeight(.bold)
                    }.padding(.vertical, 10)
                        .padding(.horizontal, 14)
                        .background(
                            Color.black.opacity(0.4)
                                .clipShape(.rect(cornerRadius: 8.0))
                        )
                }.padding(12)
            }
            .frame(height: 256.0)
            .clipShape(.rect(cornerRadius: 12.0))
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    AnimalMapView()
}
