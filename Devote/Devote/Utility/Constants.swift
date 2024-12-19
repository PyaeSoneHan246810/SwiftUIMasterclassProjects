//
//  Constants.swift
//  Devote
//
//  Created by Dylan on 09/12/2024.
//

import SwiftUI

var gradientBackground: LinearGradient {
    return LinearGradient(
        gradient: Gradient(colors: [.pink, .blue]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

let hapticFeedback = UINotificationFeedbackGenerator()
