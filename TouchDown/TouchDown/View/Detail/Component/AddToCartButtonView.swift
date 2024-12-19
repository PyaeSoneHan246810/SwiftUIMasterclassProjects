import SwiftUI

struct AddToCartButtonView: View {
    // MARK: - PROPERTIES
    var backgroundColor: Color = .black
    var foregroundColor: Color = .white
    var onClick: () -> Void = {}
    // MARK: - BODY
    var body: some View {
        Button(action: onClick) {
            Spacer()
            Text("Add to cart")
                .font(.title2.weight(.bold))
                .foregroundStyle(foregroundColor)
            Spacer()
        }.padding(.vertical, 16.0)
            .background(backgroundColor)
            .clipShape(.capsule)
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    AddToCartButtonView()
}
