import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .white,
                            .customGreenLight,
                            .customGreenMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            Circle().stroke(
                LinearGradient(
                    colors: [.customGrayLight, .customGrayMedium],
                    startPoint: .top,
                    endPoint: .bottom
                ),
                lineWidth: 4.0
            )
            Image(systemName: "figure.hiking")
                .font(.system(size: 30.0))
                .fontWeight(.black)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
                )
        }.frame(width: 60.0, height: 60.0)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CustomButtonView()
}
