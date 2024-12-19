import SwiftUI

struct FruitRowView: View {
    //MARK: PROPERTIES
    var fruit: Fruit
    //MARK: BODY
    var body: some View {
        HStack(spacing: 12.0) {
            Image(fruit.image)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 80.0, height: 80.0)
                .shadow(color: .black.opacity(0.3), radius: 3, x: 2, y: 2)
                .background(
                    LinearGradient(colors: fruit.gradientColors, startPoint: .top, endPoint: .bottom)
                )
                .clipShape(.rect(cornerRadius: 8.0))
            VStack(alignment: .leading, spacing: 4.0) {
                Text(fruit.title)
                    .font(.title2.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(fruit.headline)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
            }.frame(maxWidth: .infinity)
        }.frame(minWidth: 0.0, maxWidth: .infinity)
    }
}

//MARK: PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    FruitRowView(
        fruit: fruitsData.shuffled().first!
    ).preferredColorScheme(.dark)
        .padding()
}
