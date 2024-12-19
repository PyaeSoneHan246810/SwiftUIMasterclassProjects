//
//  NewTodoButton.swift
//  Devote
//
//  Created by Dylan on 09/12/2024.
//

import SwiftUI

struct NewTodoButton: View {
    // MARK: - PROPERTIES
    let onClick: () -> Void
    // MARK: - BODY
    var body: some View {
        Button {
            onClick()
        } label: {
            Image(systemName: "plus.circle")
                .font(.system(size: 30, design: .rounded))
                .fontWeight(.semibold)
            Text("New Todo")
                .font(.system(size: 24, design: .rounded))
                .fontWeight(.bold)
        }.foregroundStyle(.white)
            .padding(.horizontal, 20.0)
            .padding(.vertical, 16.0)
            .background(
                gradientBackground
            )
            .clipShape(.capsule)
            .shadow(color: .black.opacity(0.2), radius: 12.0)
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    NewTodoButton(onClick: {})
}
