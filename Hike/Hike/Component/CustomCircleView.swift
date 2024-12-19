import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimating: Bool = false
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .customIndigoMedium,
                            .customSalmonLight,
                        ],
                        startPoint: isAnimating ? .topLeading : .bottomLeading,
                        endPoint: isAnimating ? .bottomTrailing : .topTrailing
                    )
                ).frame(width: 256.0, height: 256.0)
                .onAppear {
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimating.toggle()
                    }
                }
            MotionAnimationView()
        }.frame(width: 256.0, height: 256.0)
            .mask(Circle())
    }
}

#Preview {
    CustomCircleView()
}
