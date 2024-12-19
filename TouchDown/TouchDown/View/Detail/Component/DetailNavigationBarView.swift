import SwiftUI

struct DetailNavigationBarView: View {
    // MARK: - PROPERTIES
    let onBackButtonPressed: () -> Void
    let onCartButtonPressed: () -> Void
    // MARK: - BODY
    var body: some View {
        HStack {
            Button(action: onBackButtonPressed) {
                Image(systemName: "chevron.backward")
                    .font(.title)
                    .foregroundStyle(.white)
            }
            Spacer()
            Button(
                action: onCartButtonPressed
            ) {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundStyle(.white)
            }
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    DetailNavigationBarView(
        onBackButtonPressed: {},
        onCartButtonPressed: {}
    ).background(.gray)
}
