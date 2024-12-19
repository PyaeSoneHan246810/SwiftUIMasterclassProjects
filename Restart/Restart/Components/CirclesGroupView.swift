import SwiftUI

struct CirclesGroupView: View {
    var shapeColor: Color
    var shapeOpacity: Double
    @State private var isAnimating: Bool = false
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40.0)
                .frame(width: 260.0, height: 260.0)
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80.0)
                .frame(width: 260.0, height: 260.0)
        }.blur(radius: isAnimating ? 0 : 10)
            .opacity(isAnimating ? 1.0 : 0.0)
            .scaleEffect(isAnimating ? 1.0 : 0.5)
            .animation(.easeOut(duration: 1.0), value: isAnimating)
            .onAppear {
                isAnimating.toggle()
            }
    }
}

#Preview {
    ZStack {
        Color.colorBlue.ignoresSafeArea(.all, edges: .all)
        CirclesGroupView(
            shapeColor: .white,
            shapeOpacity: 0.2
        )
    }
}
