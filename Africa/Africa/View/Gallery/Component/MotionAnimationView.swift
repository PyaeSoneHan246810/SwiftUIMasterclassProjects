//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Dylan on 06/12/2024.
//
import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    @State private var randomCircleCount: Int = Int.random(in: 12...16)
    @State private var isAnimated: Bool = false
    // MARK: - FUNCTIONS
    // 1. Random Coordinate
    private func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    // 2. Random Size
    private func randomSize() -> CGFloat {
        return CGFloat.random(in: 10...300)
    }
    // 3. Random Scale
    private func randomScale() -> CGFloat {
        return CGFloat.random(in: 0.1...2.0)
    }
    // 4. Random Speed
    private func randomSpped() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    // 5. Random Delay
    private func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<randomCircleCount, id: \.self) { _ in
                    Circle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(
                            width: randomSize(),
                            height: randomSize()
                        )
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .scaleEffect(isAnimated ? randomScale() : 1.0)
                }
            }.drawingGroup()
                .onAppear {
                    withAnimation(.interpolatingSpring(stiffness: 0.5, damping: 0.5).repeatForever().speed(randomSpped()).delay(randomDelay())) {
                        isAnimated = true
                    }
            }
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    MotionAnimationView()
}
