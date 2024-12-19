//
//  CreditsView.swift
//  Africa
//
//  Created by Dylan on 06/12/2024.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - PROPERTIES
    // MARK: - BODY
    var body: some View {
        VStack {
            Image(.compass)
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
    Copyright © Pyae Sone Han
    All right reserved
    Better Apps ♡ Less Code
    """).font(.footnote)
                .multilineTextAlignment(.center)
        }.padding()
            .opacity(0.5)
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    CreditsView()
}
