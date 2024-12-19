import SwiftUI

struct FruitDetailView: View {
    //MARK: PROPERTIES
    var fruit: Fruit
    
    //MARK: BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .center, spacing: 20.0) {
                //MARK: Header
                FruitDetailHeaderView(
                    fruit: fruit
                )
                
                //MARK: Body
                VStack(alignment: .leading, spacing: 20.0) {
                    //title
                    Text(fruit.title)
                        .font(.largeTitle.weight(.heavy))
                        .foregroundStyle(fruit.gradientColors.first!)
                    
                    //headline
                    Text(fruit.headline)
                        .font(.headline.weight(.medium))
                        .multilineTextAlignment(.leading)
                    
                    //nutrients
                    FruitNutrientsView(
                        fruit: fruit
                    )
                    
                    //subheadline
                    Text("Learn more about \(fruit.title)".uppercased())
                        .font(.headline.weight(.bold))
                        .foregroundStyle(fruit.gradientColors.first!)
                        .multilineTextAlignment(.leading)
                    
                    //description
                    Text(fruit.description)
                        .font(.body.weight(.regular))
                        .foregroundStyle(.primary.opacity(0.8))
                        .multilineTextAlignment(.leading)
                    
                    //link
                    SourceLinkView()
                        .padding(.top, 10.0)
                        .padding(.bottom, 40.0)
                    
                }.frame(minWidth: 0.0, maxWidth: 640, alignment: .leading)
                    .padding(.horizontal, 12.0)
            }
        }.ignoresSafeArea(edges: .top)
            .navigationTitle(fruit.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

//MARK: PREVIEW
#Preview {
    FruitDetailView(
        fruit: fruitsData.shuffled().first!
    ).preferredColorScheme(.dark)
}
