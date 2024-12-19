import SwiftUI

struct CustomGradientButtonStyle: ButtonStyle {
    let gradientColors: Array<Color>
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 16.0)
            .padding(.horizontal, 30.0)
            .background(
                configuration.isPressed ?
                LinearGradient(
                    colors: gradientColors.reversed(),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                :
                LinearGradient(
                    colors: gradientColors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .clipShape(.rect(cornerRadius: 40.0))
    }
}
