import SwiftUI

struct CategoryItemsGridView: View {
    // MARK: - PROPERTIES
    let categories: [Category]
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: horizontalGridItems, spacing: columnSpacing) {
                Section {
                    ForEach(categories, id: \.id) { category in
                        CategoryItemView(category: category)
                    }
                } header: {
                    SectionView(
                        rotateClockwise: false
                    )
                } footer: {
                    SectionView(
                        rotateClockwise: true
                    )
                }
            }.frame(minHeight: 160.0)
                .padding(.horizontal, 16.0)
                .padding(.vertical, 10.0)
        }
    }
    struct SectionView: View {
        let rotateClockwise: Bool
        var body: some View {
            VStack {
                Spacer()
                Text("Categories".uppercased())
                    .font(.footnote.weight(.bold))
                    .rotationEffect(.degrees(rotateClockwise ? 90.0 : -90.0))
                Spacer()
            }.frame(width: 85.0)
                .background(
                    colorGray.clipShape(.rect(cornerRadius: 12.0))
                )
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    CategoryItemsGridView(categories: categories)
}
