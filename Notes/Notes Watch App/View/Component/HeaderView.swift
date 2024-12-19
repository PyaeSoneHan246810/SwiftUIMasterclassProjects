//
//  HeaderView.swift
//  Notes
//
//  Created by Dylan on 14/12/2024.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    var title: String?
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 12.0) {
            if let title {
                Text(title.uppercased())
                    .font(.title3.bold())
                    .foregroundStyle(.accent)
            }
            HStack {
                Capsule()
                    .frame(height: 1.0)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1.0)
            }.foregroundStyle(.accent)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    HeaderView()
}

#Preview(traits: .sizeThatFitsLayout) {
    HeaderView(
        title: "Credits"
    )
}
