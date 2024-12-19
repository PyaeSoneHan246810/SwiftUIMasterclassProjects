import SwiftUI

struct CustomCardBackgroundView: View {
    var body: some View {
        ZStack {
            Color.customGreenDark
                .clipShape(.rect(cornerRadius: 40.0))
                .offset(y: 12.0)
            Color.customGreenLight
                .clipShape(.rect(cornerRadius: 40.0))
                .offset(y: 3.0)
                .opacity(0.8)
            LinearGradient(
                colors: [
                    .customGreenLight,
                    .customGreenMedium
                ],
                startPoint: .top,
                endPoint: .bottom
            ).clipShape(.rect(cornerRadius: 40.0))
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CustomCardBackgroundView()
}
