import SwiftUI

struct FruitNutrientsView: View {
    //MARK: PROPERTIES
    let nutrients: [String] = [
        "Energy",
        "Sugar",
        "Fat",
        "Protein",
        "Vitamins"
    ]
    var fruit: Fruit
    //MARK: BODY
    var body: some View {
        GroupBox {
            DisclosureGroup {
                ForEach(0..<nutrients.count, id: \.self) { index in
                    Divider()
                        .padding(.vertical, 2.0)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[index])
                        }.foregroundStyle(fruit.gradientColors[1])
                            .font(.body.bold())
                        Spacer(
                            minLength: 25.0
                        )
                        Text(fruit.nutrition[index])
                            .multilineTextAlignment(.trailing)
                    }
                }
            } label: {
                Text("Nutritional value per 100g")
                    .padding(.vertical, 4.0)
            }
        }
    }
}

//MARK: Preview
#Preview(traits: .sizeThatFitsLayout) {
    FruitNutrientsView(
        fruit: fruitsData.shuffled().first!
    ).preferredColorScheme(.dark)
}
