import SwiftUI

struct BrandItemsGridView: View {
    // MARK: - PROPERTIES
    let brands: [Brand]
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: horizontalGridItems, spacing: rowSpacing) {
                ForEach(brands, id: \.id) { brand in
                    BrandItemView(brand: brand)
                }
            }.padding(.horizontal, 16.0)
                .padding(.vertical, 10.0)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    BrandItemsGridView(brands: brands)
}
