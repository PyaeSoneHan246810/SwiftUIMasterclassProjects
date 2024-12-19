import SwiftUI

struct FruitDetailHeaderView: View {
    //MARK: Properties
    var fruit: Fruit
    @State private var isAnimating: Bool = false
    //MARK: Body
    var body: some View {
        ZStack {
            LinearGradient(colors: fruit.gradientColors, startPoint: .top, endPoint: .bottom)
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .scaleEffect(isAnimating ? 1.0 : 0.6)
                .shadow(color: .black.opacity(0.15), radius: 8.0, x: 6.0, y: 8.0)
                .padding(.vertical, 20.0)
                .padding(.horizontal, 20.0)
        }.frame(minWidth: 0.0, maxWidth: .infinity)
            .frame(height: 440.0)
            .onAppear {
                withAnimation(.easeOut(duration: 0.5)) {
                    isAnimating.toggle()
                }
            }
    }
}

//MARK: Preview
#Preview(traits: .sizeThatFitsLayout) {
    FruitDetailHeaderView(
        fruit: fruitsData.shuffled().first!
    ).preferredColorScheme(.dark)
        .padding()
}
