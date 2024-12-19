//
//  NoteItemView.swift
//  Notes
//
//  Created by Dylan on 14/12/2024.
//

import SwiftUI

struct NoteItemView: View {
    // MARK: - PROPERTIES
    let note: Note
    var lineCount: Int = 1
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 8.0) {
            Capsule()
                .frame(width: 4.0)
                .foregroundStyle(.accent)
            Text(note.text)
                .font(.headline)
                .lineLimit(lineCount)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    NoteItemView(note: Note.sample)
}
