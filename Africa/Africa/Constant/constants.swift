//
//  constants.swift
//  Africa
//
//  Created by Dylan on 05/12/2024.
//

import Foundation
import SwiftUI

let coverImages: [CoverImage] = Bundle.main.decode(from: "covers.json")

let animals: [Animal] = Bundle.main.decode(from: "animals.json")

let videos: [Video] = Bundle.main.decode(from: "videos.json")

let nationalParkLocations: [NationalParkLocation] = Bundle.main.decode(from: "locations.json")

let hapticFeedback = UIImpactFeedbackGenerator(style: .medium)
