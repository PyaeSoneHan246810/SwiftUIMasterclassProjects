import SwiftUI

struct FeaturedItemsTabView: View {
    // MARK: - PROPERTIES
    let players: [Player]
    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(players, id: \.id) { player in
                FeaturedItemView(player: player)
                    .padding(.horizontal, 16.0)
            }
        }.tabViewStyle(
            PageTabViewStyle(indexDisplayMode: .always)
        ).frame(minHeight: 234.0)
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    FeaturedItemsTabView(
        players: players
    ).background(Color.gray)
}
