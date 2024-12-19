import SwiftUI

struct AppContentView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var shop: Shop
    // MARK: - BODY
    var body: some View {
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                HomeView()
            } else {
                DetailView()
                    .transition(.asymmetric(insertion: .combined(.opacity)(with: .slide), removal: .combined(.opacity)(with: .push(from: .bottom))))
            }
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    AppContentView()
        .environmentObject(Shop())
}
