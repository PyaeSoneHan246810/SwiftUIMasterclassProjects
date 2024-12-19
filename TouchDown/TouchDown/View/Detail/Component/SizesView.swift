import SwiftUI

struct SizesView: View {
    // MARK: - PROPERTIES
    let sizes: [String] = ["XS", "S", "M", "L", "XL"]
    var onSizeChange: (String) -> Void = {_ in}
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .trailing, spacing: 3.0) {
            Text("Sizes")
                .font(.footnote.weight(.semibold))
                .foregroundStyle(colorGray)
            HStack(spacing: 3.0) {
                ForEach(sizes, id: \.self) { size in
                    Button {
                        hapticFeedback.impactOccurred()
                        onSizeChange(size)
                    } label: {
                        Text(size)
                            .font(.footnote.weight(.black))
                            .foregroundStyle(colorGray)
                            .frame(width: 28, height: 28)
                            .background(
                                Color.white.clipShape(.rect(cornerRadius: 5.0))
                            )
                            .background(
                                RoundedRectangle(cornerRadius: 5.0)
                                    .stroke(colorGray, lineWidth: 1.0)
                            )
                    }
                }
            }
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    SizesView()
}
