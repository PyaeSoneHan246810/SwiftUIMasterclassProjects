import SwiftUI

struct TitleView: View {
    // MARK: - PROPERTIES
    let title: String
    // MARK: - BODY
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle.weight(.heavy))
            Spacer()
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    TitleView(
        title: "Helmet"
    )
}
