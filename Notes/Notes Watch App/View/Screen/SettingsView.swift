//
//  SettingsView.swift
//  Notes
//
//  Created by Dylan on 14/12/2024.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - APP STORAGE PROPERTIES
    @AppStorage("lineCount") private var lineCount: Int = 1
    // MARK: - STATE PROPERTIES
    @State private var sliderValue: Double = 1.0
    // MARK: - FUNCTIONS
    func updateLineCount() {
        lineCount = Int(sliderValue)
    }
    // MARK: - BODY
    var body: some View {
        VStack {
            HeaderView(title: "Settings")
            Text("Lines: \(lineCount)")
                .fontWeight(.bold)
            Slider(
                value: $sliderValue,
                in: 1.0...4.0,
                step: 1.0
            ).onChange(of: sliderValue) {
                updateLineCount()
            }.onAppear {
                sliderValue = Double(lineCount)
            }
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    SettingsView()
}
