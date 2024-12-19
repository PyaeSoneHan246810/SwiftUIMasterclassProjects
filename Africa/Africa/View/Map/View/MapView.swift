//
//  MapView.swift
//  Africa
//
//  Created by Dylan on 04/12/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES
    @State private var position: MapCameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 6.60,
                longitude: 16.44
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 70.0,
                longitudeDelta: 70.0
            )
        )
    )
    @State private var latitude: Double = 6.60
    @State private var longitude: Double = 16.44
    
    // MARK: - BODY
    var body: some View {
        Map(
            position: $position
        ) {
            ForEach(nationalParkLocations) { location in
                Annotation(coordinate: location.location) {
                    MapAnnotationView(
                        location: location
                    )
                } label: {}
            }
        }.mapStyle(.standard)
            .onMapCameraChange(frequency: .continuous) { context in
                latitude = context.region.center.latitude
                longitude = context.region.center.longitude
            }
            .overlay(alignment: .top) {
                MapOverlayView(
                    latitude: latitude,
                    longitude: longitude
                )
            }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    MapView()
}
