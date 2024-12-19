//
//  AnimalFactsTabView.swift
//  Africa
//
//  Created by Dylan on 05/12/2024.
//

import SwiftUI

struct AnimalFactsTabView: View {
    // MARK: - PROPERTIES
    let facts: [String]
    // MARK: - BODY
    var body: some View {
        GroupBox {
            TabView {
                ForEach(facts, id: \.self) { fact in
                    Text(fact)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 12.0)
                }
            }.tabViewStyle(.page(indexDisplayMode: .always))
        }.frame(minHeight: 200.0, maxHeight: 240.0)
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    let facts = animals.randomElement()!.fact
    AnimalFactsTabView(facts: facts)
}
