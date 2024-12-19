//
//  MapOverlayView.swift
//  Africa
//
//  Created by Dylan on 06/12/2024.
//

import SwiftUI

struct MapOverlayView: View {
    // MARK: - PROPERTIES
    let latitude: Double
    let longitude: Double
    // MARK: - BODY
    var body: some View {
        HStack {
            Image(.compass)
                .resizable()
                .scaledToFit()
                .frame(width: 48.0, height: 48.0)
            VStack(alignment: .leading, spacing: 3.0) {
                HStack {
                    Text("Latitude")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundStyle(.accent)
                    Spacer()
                    Text("\(latitude)")
                        .font(.footnote)
                        .foregroundStyle(.white)
                }
                Divider()
                HStack {
                    Text("Longitude")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundStyle(.accent)
                    Spacer()
                    Text("\(longitude)")
                        .font(.footnote)
                        .foregroundStyle(.white)
                }
            }
        }.padding(.vertical, 12.0)
            .padding(.horizontal, 16.0)
            .background(
                Color.black
                    .opacity(0.5)
            )
            .clipShape(.rect(cornerRadius: 8.0))
            .padding()
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    MapOverlayView(
        latitude: 6.60,
        longitude: 16.44
    )
}
