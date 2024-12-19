//
//  ImageBackgroundView.swift
//  Devote
//
//  Created by Dylan on 09/12/2024.
//

import SwiftUI

struct ImageBackgroundView: View {
    // MARK: - PROPERTIES
    // MARK: - BODY
    var body: some View {
        ZStack {
            gradientBackground
            Image(.rocket)
                .antialiased(true)
                .resizable()
                .scaledToFill()
        }.ignoresSafeArea()
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    ImageBackgroundView()
}
