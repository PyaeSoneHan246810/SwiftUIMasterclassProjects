//
//  GalleryView.swift
//  Africa
//
//  Created by Dylan on 04/12/2024.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    @AppStorage("gallerySelectedImage") private var selectedImage: String = animals.first!.image
    @AppStorage("galleryGridColumnCount") private var gridColumnCount: Double = 3
    private var gridItems: [GridItem] {
        return Array(
            repeating: GridItem(.flexible()),
            count: Int(gridColumnCount)
        )
    }
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 30.0) {
                Image(selectedImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.circle)
                    .overlay {
                        Circle()
                            .stroke(.white, lineWidth: 2.0)
                    }
                    .animation(.smooth, value: selectedImage)
                Slider(value: $gridColumnCount, in: 2...4, step: 1)
                LazyVGrid(columns: gridItems, alignment: .center, spacing: 12.0) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFill()
                            .clipShape(.circle)
                            .overlay {
                                Circle()
                                    .stroke(animal.image == selectedImage ? .accent : .white, lineWidth: 1.0)
                            }.onTapGesture {
                                selectedImage = animal.image
                                hapticFeedback.impactOccurred()
                            }
                            .animation(.smooth, value: selectedImage)
                    }
                }.animation(.easeIn, value: gridColumnCount)
            }.padding(.horizontal, 12.0)
                .padding(.vertical, 50.0)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                MotionAnimationView()
                    .ignoresSafeArea()
            )
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    GalleryView()
}
