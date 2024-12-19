import SwiftUI

struct DetailProductPriceSectionView: View {
    // MARK: - PROPERTIES
    @State private var isAnimated: Bool = false
    let formattedPrice: String
    let image: String
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 0.0) {
            VStack(alignment: .leading, spacing: 6.0) {
                Text("Price")
                    .fontWeight(.semibold)
                Text(formattedPrice)
                    .font(.system(size: 52.0).weight(.black))
            }.offset(y: isAnimated ? -50.0 : -75.0)
            Spacer(
                minLength: 12.0
            )
            Image(image)
                .resizable()
                .scaledToFit()
                .opacity(isAnimated ? 1.0 : 0.0)
                .offset(y: isAnimated ? -0.0 : -35.0)
        }.onAppear {
            withAnimation(.easeOut(duration: 0.75)) {
                isAnimated = true
            }
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    let previewProduct = products.randomElement()!
    DetailProductPriceSectionView(
        formattedPrice: previewProduct.formattedPrice,
        image: previewProduct.image
    )
}
