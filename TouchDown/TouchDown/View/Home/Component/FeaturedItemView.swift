import SwiftUI

struct FeaturedItemView: View {
    // MARK: - PROPERTIES
    let player: Player
    // MARK: - BODY
    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 12.0))
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    FeaturedItemView(
        player: players.randomElement()!
    )
}
