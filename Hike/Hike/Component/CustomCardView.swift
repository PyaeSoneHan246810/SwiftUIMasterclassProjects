import SwiftUI

struct CustomCardView: View {
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    let onCustomButtonClick: () -> Void
    private func generateRandomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        imageNumber = randomNumber
    }
    var body: some View {
        ZStack {
            //background
            CustomCardBackgroundView()
            //main content
            VStack {
                //header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .font(.system(size: 52.0))
                            .fontWeight(.black)
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        .customGrayLight,
                                        .customGrayMedium
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                        Spacer()
                        Button {
                            //show a sheet
                            onCustomButtonClick()
                        } label: {
                            CustomButtonView()
                        }
                    }
                    Text("Fun and enjoyable outdoor activities for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundStyle(
                            Color.customGrayMedium
                        )
                }.padding(.horizontal, 30.0)
                //body
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(
                            .smooth(duration: 0.8),
                            value: imageNumber
                        )
                }
                //footer
                Button {
                    //generate random image
                    generateRandomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.customGreenLight, .customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(
                            color: .black,
                            radius: 0.25,
                            x: 0.0,
                            y: 2.0
                        )
                }.buttonStyle(
                    CustomGradientButtonStyle(
                        gradientColors: [.customGrayLight, .customGrayMedium]
                    )
                )
            }
        }.frame(width: 360.0, height: 600.0)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CustomCardView(
        onCustomButtonClick: {}
    )
}
