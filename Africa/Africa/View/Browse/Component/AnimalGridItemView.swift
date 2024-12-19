//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Dylan on 06/12/2024.
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    // MARK: - BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 12.0))
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    let animal = animals.randomElement()!
    AnimalGridItemView(
        animal: animal
    )
}
