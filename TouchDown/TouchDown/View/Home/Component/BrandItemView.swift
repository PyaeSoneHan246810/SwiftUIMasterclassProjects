import SwiftUI

struct BrandItemView: View {
    // MARK: - PROPERTIES
    let brand: Brand
    // MARK: - BODY
    var body: some View {
        Button {
            hapticFeedback.impactOccurred()
        } label: {
            Image(brand.image)
                .resizable()
                .scaledToFit()
                .padding(3.0)
                .background(
                    Color.white.clipShape(.rect(cornerRadius: 12.0))
                )
                .background(
                    RoundedRectangle(cornerRadius: 12.0)
                        .stroke(.gray, lineWidth: 1.0)
                )
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    BrandItemView(
        brand: brands.randomElement()!
    )
}
