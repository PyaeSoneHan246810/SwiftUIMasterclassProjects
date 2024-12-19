import SwiftUI

struct FavoriteButtonView: View {
    // MARK: - PROPERTIES
    var onClick: () -> Void = {}
    // MARK: - BODY
    var body: some View {
        Button(action: onClick) {
            Image(systemName: "heart.circle")
                .font(.largeTitle)
                .foregroundStyle(.pink)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    FavoriteButtonView()
}
