import SwiftUI

struct ProductItemView: View {
    // MARK: - PROPERTIES
    let product: Product
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 6.0) {
            ZStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10.0)
            }.background(
                product.backgroundColor
                    .clipShape(.rect(cornerRadius: 12.0))
            )
            Text(product.name)
                .font(.title3.weight(.black))
                .foregroundStyle(.black)
            Text(product.formattedPrice)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    ProductItemView(
        product: products.randomElement()!
    )
}
