import SwiftUI

struct FooterView: View {
    // MARK: - PROPERTIES
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 10.0) {
            Text("We offer the most cutting edge, comfortable, lightweight and durable football helmets in the market at affordable prices.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
                .layoutPriority(2)
            Image(.logoLineal)
                .renderingMode(.template)
                .foregroundStyle(.gray)
                .layoutPriority(0)
            Text("Copyright © Pyae Sone Han\nRights Reserved.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
                .font(.footnote.weight(.bold))
                .layoutPriority(1)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    FooterView()
}
