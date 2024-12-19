import SwiftUI

struct ListSeperator: View {
    var body: some View {
        Rectangle()
            .frame(height: 0.6)
            .foregroundStyle(.secondary.opacity(0.6))
            .clipShape(.rect(cornerRadius: 50.0))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ListSeperator()
        .preferredColorScheme(.dark)
        .padding()
}
