import SwiftUI

struct LogoView: View {
    // MARK: - PROPERTIES
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 4.0) {
            Text("Touch".uppercased())
                .font(.title3.weight(.black))
                .foregroundStyle(.black)
            Image(.logoDark)
                .resizable()
                .scaledToFit()
                .frame(width: 30.0, height: 30.0)
            Text("Down".uppercased())
                .font(.title3.weight(.black))
                .foregroundStyle(.black)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    LogoView()
}
