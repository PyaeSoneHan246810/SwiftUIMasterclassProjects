import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var shop: Shop
    @State private var quantity: Int = 0
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 6.0) {
                DetailNavigationBarView(
                    onBackButtonPressed: {
                        hapticFeedback.impactOccurred()
                        withAnimation(.easeIn) {
                            shop.selectedProduct = nil
                            shop.showingProduct = false
                        }
                    },
                    onCartButtonPressed: {
                        hapticFeedback.impactOccurred()
                    }
                ).padding(.horizontal, 16.0)
                    .padding(.vertical)
                    .padding(.top, geometry.safeAreaInsets.top)
                VStack(alignment: .center, spacing: 6.0) {
                    DetailHeaderView(
                        headerLabel: "Protective Gear",
                        productName: shop.selectedProduct?.name ?? Product.sampleProduct.name
                    ).frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16.0)
                    DetailProductPriceSectionView(
                        formattedPrice: shop.selectedProduct?.formattedPrice ?? Product.sampleProduct.formattedPrice,
                        image: shop.selectedProduct?.image ?? Product.sampleProduct.image
                    ).frame(maxWidth: .infinity)
                        .padding(.horizontal, 16.0)
                        .zIndex(1)
                    VStack(alignment: .center, spacing: 12.0) {
                        HStack {
                            RatingsView(
                                onRatingChange: { _ in}
                            )
                            Spacer()
                            SizesView(
                                onSizeChange: { _ in}
                            )
                        }
                        ScrollView(.vertical, showsIndicators: false) {
                            Text(shop.selectedProduct?.description ?? Product.sampleProduct.description)
                                .font(.system(.body, design: .rounded))
                                .foregroundStyle(.gray)
                                .multilineTextAlignment(.leading)
                        }
                        HStack {
                            QuantitiesView(
                                quantity: $quantity
                            )
                            Spacer()
                            FavoriteButtonView(
                                onClick: {
                                    hapticFeedback.impactOccurred()
                                }
                            )
                        }
                        AddToCartButtonView(
                            backgroundColor: shop.selectedProduct?.backgroundColor ?? Product.sampleProduct.backgroundColor,
                            foregroundColor: .white,
                            onClick: {
                                hapticFeedback.impactOccurred()
                            }
                        )
                    }.padding(.horizontal, 16.0)
                        .padding(.bottom, 20.0)
                        .background(
                            Color.white.clipShape(.rect(
                                topLeadingRadius: 35.0,
                                topTrailingRadius: 35.0
                            ))
                            .padding(.top, -105.0)
                        ).zIndex(0)
                }
            }.background(shop.selectedProduct?.backgroundColor ?? Product.sampleProduct.backgroundColor)
                .ignoresSafeArea()
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    DetailView()
        .environmentObject(Shop())
}
