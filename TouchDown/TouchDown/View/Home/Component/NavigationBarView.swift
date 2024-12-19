import SwiftUI

struct NavigationBarView: View {
    // MARK: - PROPERTIES
    @State private var isAnimated: Bool = false
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 0.0) {
            Button {
                hapticFeedback.impactOccurred()
            } label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundStyle(.black)
            }
            Spacer()
            LogoView()
                .opacity(isAnimated ? 1.0 : 0.0)
                .offset(y: isAnimated ? 0.0 : -16.0)
                .animation(.easeOut(duration: 0.5), value: isAnimated)
            Spacer()
            Button {
                hapticFeedback.impactOccurred()
            } label: {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundStyle(.black)
                    Circle()
                        .fill(Color.red)
                        .frame(width: 14.0, height: 12.0)
                        .offset(x: 13.0, y: -10.0)
                }
            }
        }.onAppear {
            isAnimated = true
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    NavigationBarView()
}
