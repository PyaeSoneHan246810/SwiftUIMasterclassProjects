import SwiftUI

struct CategoryItemView: View {
    // MARK: - PROPERTIES
    let category: Category
    // MARK: - BODY
    var body: some View {
        Button {
            hapticFeedback.impactOccurred()
        } label: {
            HStack(spacing: 6.0) {
                Image(category.image)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40.0, height: 40.0)
                    .foregroundStyle(.gray)
                Text(category.name)
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                Spacer()
            }.padding()
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
    CategoryItemView(
        category: categories.randomElement()!
    )
}
