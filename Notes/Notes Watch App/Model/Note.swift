//
//  Note.swift
//  Notes
//
//  Created by Dylan on 14/12/2024.
//

import Foundation

struct Note: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    let text: String
}

extension Note {
    static var sample: Note = Note(text: "SwiftUI")
}
