//
//  CreditsView.swift
//  Notes
//
//  Created by Dylan on 14/12/2024.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - PROPERTIES
    // MARK: - BODY
    var body: some View {
        VStack {
            Image(.developerNo1)
                .resizable()
                .scaledToFit()
                .frame(width: 100.0, height: 100.0)
            HeaderView(title: "Credits")
            CreditsInfoView()
        }
    }
}

struct CreditsInfoView: View {
    // MARK: - PROPERTIES
    // MARK: - BODY
    var body: some View {
        VStack {
            Text("Pyae Sone Han")
                .fontWeight(.bold)
                .foregroundStyle(.primary)
            Text("Developer")
                .font(.footnote)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    CreditsView()
}
