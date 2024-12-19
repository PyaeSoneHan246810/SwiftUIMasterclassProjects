import SwiftUI

struct DetailHeaderView: View {
    // MARK: - PROPERTIES
    let headerLabel: String
    let productName: String
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            Text("Protective Gear")
                .foregroundStyle(.white)
            Text(productName)
                .font(.largeTitle.weight(.black))
                .foregroundStyle(.white)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    DetailHeaderView(
        headerLabel: "Protective Gear",
        productName: "Red Helmet"
    ).background(.gray)
}
