//
//  DetailView.swift
//  Notes
//
//  Created by Dylan on 14/12/2024.
//

import SwiftUI

enum DetailViewSheet: Int, Identifiable {
    case settingsSheet = 1
    case creditsSheet
    var id: Int {
        rawValue
    }
}

struct DetailView: View {
    // MARK: - STATE PROPERTIES
    @State private var detailViewSheet: DetailViewSheet?
    // MARK: - PROPERTIES
    let note: Note
    let notesCount: Int
    let noteIndex: Int
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 12.0) {
            HeaderView()
            DetailBodyScrollView(
                text: note.text
            )
            DetailFooterView(
                notesCount: notesCount,
                noteIndex: noteIndex,
                onSettingsTapped: {
                    detailViewSheet = .settingsSheet
                },
                onCreditsTapped: {
                    detailViewSheet = .creditsSheet
                }
            )
        }.sheet(item: $detailViewSheet) { detailViewSheet in
            switch detailViewSheet {
            case .settingsSheet:
                SettingsView()
            case .creditsSheet:
                CreditsView()
            }
        }
    }
}

struct DetailBodyScrollView: View {
    // MARK: - PROPERTIES
    let text: String
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text(text)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
        }
    }
}

struct DetailFooterView: View {
    // MARK: - PROPERTIES
    let notesCount: Int
    let noteIndex: Int
    let onSettingsTapped: () -> Void
    let onCreditsTapped: () -> Void
    // MARK: - BODY
    var body: some View {
        HStack {
            Button {
                onSettingsTapped()
            } label: {
                Image(systemName: "gear")
                    .imageScale(.large)
            }.fixedSize()
                .buttonStyle(.plain)
            Spacer()
            Text("\(notesCount) / \(noteIndex + 1)")
            Spacer()
            Button {
                onCreditsTapped()
            } label: {
                Image(systemName: "info.circle")
                    .imageScale(.large)
            }.fixedSize()
                .buttonStyle(.plain)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    NavigationStack {
        DetailView(
            note: Note.sample,
            notesCount: 10,
            noteIndex: 0
        )
    }
}
