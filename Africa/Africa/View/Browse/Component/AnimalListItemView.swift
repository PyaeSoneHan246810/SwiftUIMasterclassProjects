//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Dylan on 05/12/2024.
//

import SwiftUI

struct AnimalListItemView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90.0, height: 90.0)
                .clipShape(.rect(cornerRadius: 12.0))
            VStack(alignment: .leading, spacing: 8.0) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8.0)
            }.frame(maxWidth: .infinity, alignment: .leading)
        }.frame(maxWidth: .infinity)
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    AnimalListItemView(
        animal: animals.randomElement()!
    )
}
