import SwiftUI

struct MotionAnimationView: View {
    @State private var isAnimating: Bool = false
    private let randomCircleCount: Int = Int.random(in: 6...12)
    private func randomCoordinate() -> CGFloat {
        CGFloat.random(in: 0...256)
    }
    private func randomSize() -> CGFloat {
        CGFloat.random(in: 4...80)
    }
    private func randomScale() -> CGFloat {
        CGFloat.random(in: 0.1...2.0)
    }
    private func randomSpeed() -> Double {
        Double.random(in: 0.05...1.0)
    }
    private func randomDelay() -> Double {
        Double.random(in: 0...2)
    }
    var body: some View {
        ZStack {
            ForEach(0..<randomCircleCount, id: \.self) { index in
                Circle()
                    .frame(width: randomSize(), height: randomSize())
                    .position(x: randomCoordinate(), y: randomCoordinate())
                    .scaleEffect(isAnimating ? randomScale() : 1.0)
                    .foregroundStyle(.white)
                    .opacity(0.25)
                    .onAppear {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.35)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating.toggle()
                        }
                    }
            }
        }.frame(width: 256.0, height: 265.0)
            .mask(Circle())
            .drawingGroup()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ZStack {
        Color.teal
        MotionAnimationView()
    }.frame(width: 256.0, height: 256.0)
        .mask(Circle())
}
