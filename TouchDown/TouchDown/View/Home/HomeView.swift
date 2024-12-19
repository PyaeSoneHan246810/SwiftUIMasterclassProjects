import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var shop: Shop
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 0.0) {
            NavigationBarView()
                .padding(.horizontal, 16.0)
                .padding(.vertical)
                .background(Color.white)
                .shadow(
                    color: .black.opacity(0.05),
                    radius: 5.0,
                    x: 0.0,
                    y: 5.0
                )
            ScrollView(
                .vertical,
                showsIndicators: false
            ) {
                LazyVStack(spacing: 0.0) {
                    FeaturedItemsTabView(
                        players: players
                    ) .padding(.vertical, 10.0)
                    CategoryItemsGridView(
                        categories: categories
                    )
                    TitleView(
                        title: "Helmet"
                    ).padding(.horizontal, 16.0)
                        .padding(.top, 10.0)
                    ProductItemsGridView(
                        products: products,
                        onItemTap: { product in
                            hapticFeedback.impactOccurred()
                            withAnimation(.easeOut) {
                                shop.selectedProduct = product
                                shop.showingProduct = true
                            }
                        }
                    )
                    TitleView(
                        title: "Brands"
                    ).padding(.horizontal, 16.0)
                        .padding(.top, 10.0)
                    BrandItemsGridView(
                        brands: brands
                    )
                    FooterView()
                        .padding(.horizontal, 16.0)
                            .padding(.vertical, 10.0)
                }
            }
        }.background(
            colorBackground.ignoresSafeArea()
        )
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    HomeView()
        .environmentObject(Shop())
}
