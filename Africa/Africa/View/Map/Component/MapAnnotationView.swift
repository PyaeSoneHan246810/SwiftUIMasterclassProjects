//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Dylan on 06/12/2024.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - PROPERTIES
    let location: NationalParkLocation
    @State private var isAnimated: Bool = false
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54.0, height: 54.0)
            Circle()
                .stroke(Color.accentColor, lineWidth: 1.8)
                .frame(width: 52.0, height: 52.0)
                .scaleEffect(isAnimated ? 2.0 : 1.0)
                .opacity(isAnimated ? 0.0 : 1.0)
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48.0, height: 48.0)
                .clipShape(.circle)
            
        }.onAppear {
            withAnimation(.easeOut(duration: 2.0).repeatForever(autoreverses: false)) {
                isAnimated = true
            }
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    let location = nationalParkLocations.randomElement()!
    MapAnnotationView(
        location: location
    )
}
