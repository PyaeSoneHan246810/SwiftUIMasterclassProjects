import SwiftUI

struct FruitCardView: View {
    //MARK: PROPERTIES
    @State private var isAnimating: Bool = false
    var fruit: Fruit
    var onStartButtonClick: () -> Void = {}
    
    //MARK: BODY
    var body: some View {
        ZStack(alignment: .center) {
            //Background Gradient
            LinearGradient(
                colors: fruit.gradientColors,
                startPoint: .top,
                endPoint: .bottom
            )
            
            //Main Content
            VStack(spacing: 20.0) {
                //Image
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .black.opacity(0.15), radius: 8.0, x: 6.0, y: 8.0)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                //Title
                Text(fruit.title)
                    .font(.largeTitle.weight(.heavy))
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.15), radius: 2.0, x: 2.0, y: 2.0)
                //Headline
                Text(fruit.headline)
                    .font(.body.weight(.regular))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16.0)
                    .frame(maxWidth: 480.0)
                //Button
                StartButtonView(
                    onClick: onStartButtonClick
                )
            }//: Main Content
            
        }.onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }.frame(minWidth: 0.0, maxWidth: .infinity, minHeight: 0.0, maxHeight: .infinity)
            .clipShape(.rect(cornerRadius: 20.0))
            .padding(.horizontal, 20.0)//: ZStack
    }
}

//MARK: PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    FruitCardView(
        fruit: fruitsData.shuffled().first!
    ).preferredColorScheme(.dark)
        .padding()
}
