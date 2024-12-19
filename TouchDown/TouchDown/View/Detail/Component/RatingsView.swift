import SwiftUI

struct RatingsView: View {
    // MARK: - PROPERTIES
    var onRatingChange: (Int) -> Void = { _ in }
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 3.0) {
            Text("Ratings")
                .font(.footnote.weight(.semibold))
                .foregroundStyle(colorGray)
            HStack(spacing: 3.0) {
                ForEach(1...5, id: \.self) { rating in
                    Button{
                        hapticFeedback.impactOccurred()
                        onRatingChange(rating)
                    } label: {
                        Image(systemName: "star.fill")
                            .frame(width: 28, height: 28)
                            .background(
                                colorGray.clipShape(.rect(cornerRadius: 5.0))
                            )
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    RatingsView()
}
