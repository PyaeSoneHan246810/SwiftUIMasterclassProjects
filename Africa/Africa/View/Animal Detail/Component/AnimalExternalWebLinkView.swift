//
//  AnimalExternalWebLinkView.swift
//  Africa
//
//  Created by Dylan on 05/12/2024.
//

import SwiftUI

struct AnimalExternalWebLinkView: View {
    // MARK: - PROPERTIES
    let link: String
    let animalName: String
    // MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Link(destination: URL(string: link) ?? URL(string: "https://wikipedia.org")!) {
                    Image(systemName: "arrow.up.right.square")
                    Text(animalName)
                }.foregroundStyle(.accent)
            }
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    let link = animals.randomElement()!.link
    let name = animals.randomElement()!.name
    AnimalExternalWebLinkView(
        link: link,
        animalName: name
    )
}
