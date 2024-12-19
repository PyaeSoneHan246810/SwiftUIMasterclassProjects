//
//  StringExtension.swift
//  Devote
//
//  Created by Dylan on 09/12/2024.
//

extension String {
    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
