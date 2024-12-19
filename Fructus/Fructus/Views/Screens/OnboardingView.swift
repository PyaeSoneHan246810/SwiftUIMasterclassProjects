import SwiftUI

struct OnboardingView: View {
    //MARK: PROPERTIES
    var fruits: [Fruit] = fruitsData
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    
    //MARK: BODY
    var body: some View {
        //TabView
        TabView {
            ForEach(fruits[0...4]) { fruit in
                FruitCardView(
                    fruit: fruit,
                    onStartButtonClick: {
                        isOnboardingComplete = true
                    }
                )
            }
        }.tabViewStyle(.page(indexDisplayMode: .always))
            .padding(.vertical, 20.0)//: TabView
    }
}

//MARK: PREVIEW
#Preview {
    OnboardingView()
        .preferredColorScheme(.dark)
}
