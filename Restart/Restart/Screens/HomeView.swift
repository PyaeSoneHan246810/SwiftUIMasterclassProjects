import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") private var isOnboardingVisible: Bool = false
    
    @State private var isAnimating: Bool = false
    
    //MARK: BODY
    var body: some View {
        VStack(spacing: 20.0) {
            
            Spacer()
            
            //MARK: HEADER
            ZStack(alignment: .center) {
                CirclesGroupView(
                    shapeColor: .gray,
                    shapeOpacity: 0.1
                )
                CharacterImageView(
                    imageResource: .character2
                ).offset(y: isAnimating ? 35.0: -35.0)
                    .animation(.easeInOut(duration: 4.0).repeatForever(
                        autoreverses: true
                    ), value: isAnimating)
            }//: HEADER
            
            Spacer()
            
            //MARK: CENTER
            VStack {
                Text("The time that leads to mastery is dependent on the itensity of our focus.")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
            }//: CENTER
            
            Spacer()
            
            //MARK: FOOTER BUTTON
            
            Button {
                isOnboardingVisible.toggle()
                playSound(soundFile: "success", fileType: "m4a")
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded, weight: .bold))
            }.buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)//: FOOTER BUTTON
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating.toggle()
            }
        }.preferredColorScheme(.none)
    }
}

#Preview {
    HomeView()
}
