//
//  Animal.swift
//  Africa
//
//  Created by Dylan on 05/12/2024.
//

struct Animal: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
