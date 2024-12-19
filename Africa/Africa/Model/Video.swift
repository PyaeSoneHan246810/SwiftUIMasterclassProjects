//
//  Video.swift
//  Africa
//
//  Created by Dylan on 05/12/2024.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    var videoThumbnil: String {
        "video-\(id)"
    }
}
