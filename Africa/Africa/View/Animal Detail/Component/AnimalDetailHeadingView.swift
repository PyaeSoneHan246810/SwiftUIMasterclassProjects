//
//  AnimalDetailHeadingView.swift
//  Africa
//
//  Created by Dylan on 05/12/2024.
//

import SwiftUI

struct AnimalDetailHeadingView: View {
    // MARK: - PROPERTIES
    let headingImage: String
    let headingText: String
    // MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundStyle(.accent)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }.padding(.vertical, 8.0)
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    AnimalDetailHeadingView(
        headingImage: 
            "photo.on.rectangle.angled",
        headingText: "Wilderness in Picture"
    )
}
