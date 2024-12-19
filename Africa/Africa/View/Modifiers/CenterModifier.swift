//
//  CenterModifier.swift
//  Africa
//
//  Created by Dylan on 06/12/2024.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
