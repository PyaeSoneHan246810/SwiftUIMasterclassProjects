//
//  BundleExtension.swift
//  Africa
//
//  Created by Dylan on 05/12/2024.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) file in Bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load data from \(file) file in Bundle")
        }
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Failed to decode data from \(file) file in Bundle.")
        }
        return decodedData
    }
}
