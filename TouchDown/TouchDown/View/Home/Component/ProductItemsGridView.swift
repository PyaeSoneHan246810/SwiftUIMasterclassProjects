import SwiftUI

struct ProductItemsGridView: View {
    // MARK: - PROPERTIES
    let products: [Product]
    let onItemTap: (Product) -> Void
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: verticalGridItems, spacing: rowSpacing) {
                ForEach(products, id: \.id) { product in
                    ProductItemView(
                        product: product
                    ).onTapGesture {
                        onItemTap(product)
                    }
                }
            }.padding(.horizontal, 16.0)
                .padding(.vertical, 10.0)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    ProductItemsGridView(
        products: products,
        onItemTap: { _ in}
    )
}
