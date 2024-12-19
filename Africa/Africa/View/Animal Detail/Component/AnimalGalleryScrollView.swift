//
//  AnimalGalleryScrollView.swift
//  Africa
//
//  Created by Dylan on 05/12/2024.
//

import SwiftUI

struct AnimalGalleryScrollView: View {
    // MARK: - PROPERTIES
    let gallery: [String]
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12.0) {
                ForEach(gallery, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200.0)
                        .clipShape(.rect(cornerRadius: 12.0))
                }
            }.padding(.horizontal, 12.0)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    let gallery = animals.randomElement()!.gallery
    AnimalGalleryScrollView(gallery: gallery)
}
