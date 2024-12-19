//
//  HomeView.swift
//  Notes Watch App
//
//  Created by Dylan on 14/12/2024.
//

import SwiftUI

struct HomeView: View {
    // MARK: - APP STORAGE PROPERTIES
    @AppStorage("lineCount") private var lineCount: Int = 1
    
    // MARK: - STATE PROPERTIES
    @State private var notes: [Note] = []
    @State private var text: String = ""
    
    // MARK: - COMPUTED PROPERTIES
    var isNoteValid: Bool {
        !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 4.0) {
                    TextField("Add New Note", text: $text)
                    Button {
                        let note = Note(
                            text: text.trimmingCharacters(in: .whitespacesAndNewlines)
                        )
                        notes.append(note)
                        text = ""
                        saveNotes()
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 40.0, weight: .semibold))
                    }.fixedSize()
                        .buttonStyle(.plain)
                        .foregroundStyle(.accent)
                        .disabled(!isNoteValid)
                }
                if notes.isEmpty {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray.opacity(0.20))
                        .padding(20.0)
                    Spacer()
                } else {
                    List {
                        ForEach(notes) { note in
                            NavigationLink(value: note) {
                                NoteItemView(
                                    note: note,
                                    lineCount: lineCount
                                )
                            }
                        }.onDelete { indexSet in
                            indexSet.forEach { index in
                                notes.remove(at: index)
                                saveNotes()
                            }
                        }
                    }
                }
            }.navigationTitle("Notes")
                .navigationDestination(for: Note.self) { note in
                    DetailView(
                        note: note,
                        notesCount: notes.count,
                        noteIndex: notes.firstIndex(of: note)!
                    )
                }
                .onAppear(perform: loadNotes)
        }
    }
    
    // MARK: - FUNCTIONS
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let url = path[0]
        return url
    }
    
    private func loadNotes() {
        DispatchQueue.main.async {
            do {
                let url = getDocumentDirectory().appendingPathComponent("notes", conformingTo: .fileURL)
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let notes = try decoder.decode([Note].self, from: data)
                self.notes = notes
            } catch {
                print("Failed to load notes.")
            }
        }
    }
    
    private func saveNotes() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes", conformingTo: .fileURL)
            try data.write(to: url)
        } catch {
            print("Failed to save notes.")
        }
    }
    
    
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    HomeView()
}
