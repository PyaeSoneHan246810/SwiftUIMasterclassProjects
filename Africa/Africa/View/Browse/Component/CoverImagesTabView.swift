//
//  CoverImagesTabView.swift
//  Africa
//
//  Created by Dylan on 05/12/2024.
//

import SwiftUI

struct CoverImagesTabView: View {
    // MARK: - PROPERTIES
    let coverImages: [CoverImage]
    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(coverImages) { coverImage in
                Image(coverImage.name)
                    .resizable()
                    .scaledToFill()
            }
        }.tabViewStyle(.page(indexDisplayMode: .always))
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    CoverImagesTabView(
        coverImages: coverImages
    )
}
