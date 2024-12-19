import SwiftUI

struct QuantitiesView: View {
    // MARK: - PROPERTIES
    @Binding var quantity: Int
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 6.0) {
            Button {
                hapticFeedback.impactOccurred()
                if quantity > 0 {
                    quantity -= 1
                }
            } label: {
                Image(systemName: "minus.circle")
            }
            Text(String(quantity))
                .font(.title)
                .fontWeight(.semibold)
                .frame(minWidth: 46.0)
            Button {
                hapticFeedback.impactOccurred()
                quantity += 1
            } label: {
                Image(systemName: "plus.circle")
            }
        }.font(.largeTitle)
            .foregroundStyle(.black)
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    QuantitiesView(
        quantity: .constant(0)
    )
}
