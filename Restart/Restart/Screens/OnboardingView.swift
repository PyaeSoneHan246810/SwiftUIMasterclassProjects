import SwiftUI

struct OnboardingView: View {

    @AppStorage("onboarding") private var isOnboardingVisible: Bool = true
    
    @State private var isAnimating: Bool = false
    @State private var textTitle: String = "Share."
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var buttonOffset: CGFloat = 0.0
    
    private let buttonWidth: Double = UIScreen.main.bounds.width - 80.0
    private let hapticFeedback = UINotificationFeedbackGenerator()
    
    //MARK: BODY
    var body: some View {
        ZStack {
            //MARK: BACKGROUND
            Color.colorBlue.ignoresSafeArea()//: BACKGROUND
            
            //MARK: MAIN CONTENT
            VStack(spacing: 20.0) {
                
                Spacer()
                
                //MARK: HEADER
                VStack(spacing: 0.0) {
                    //title
                    Text(textTitle)
                        .font(.system(size: 60.0, weight: .heavy))
                        .foregroundStyle(.white)
                        .transition(.opacity)
                        .id(textTitle)
                    //subtitle
                    Text("""
                    It's not how much we give but
                    how much love we put into giving.
                    """).font(.title3)
                        .fontWeight(.light)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10.0)
                }.opacity(isAnimating ? 1.0 : 0.0)
                    .offset(y: isAnimating ? 0.0: -40.0)
                    .animation(.easeOut(duration: 1.0), value: isAnimating)//: HEADER
                
                Spacer()
                
                //MARK: CENTER
                ZStack(alignment: .center) {
                    //circles
                    CirclesGroupView(
                        shapeColor: .white,
                        shapeOpacity: 0.2
                    ).offset(x: imageOffset.width * -1, y: 0.0)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1.0), value: imageOffset)
                    //image
                    CharacterImageView(
                        imageResource: .character1
                    ).opacity(isAnimating ? 1.0 : 0.0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0.0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20.0)))
                        .gesture(
                            DragGesture()
                                .onChanged { gestureValue in
                                    if abs(imageOffset.width) <= 140.0 {
                                        imageOffset = gestureValue.translation
                                    }
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 0.0
                                        textTitle = "Give."
                                    }
                                }
                                .onEnded { _ in
                                    imageOffset = .zero
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 1.0
                                        textTitle = "Share."
                                    }
                                }
                        )
                        .animation(.easeOut(duration: 1.0), value: imageOffset)
                }.overlay(alignment: .bottom) {
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundStyle(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1.0 : 0.0)
                        .animation(.easeOut(duration: 1.0).delay(1.0), value: isAnimating)
                        .opacity(indicatorOpacity)
                }//: CENTER
                
                Spacer()
                
                //MARK: FOOTER BUTTON
                ZStack(alignment: .center) {
                    //1. background
                    ZStack(alignment: .center) {
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                            .padding(8.0)
                    }.frame(width: buttonWidth, height: 80.0)
                    
                    //2. cal-to-action text
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded, weight: .bold))
                        .foregroundStyle(.white)
                        .offset(x: 20.0)
                    
                    //3. capsule (dynamic width)
                    HStack {
                        Capsule()
                            .fill(Color.colorRed)
                            .frame(width: buttonOffset + 80.0, height: 80.0)
                        Spacer()
                    }.frame(width: buttonWidth, height: 80.0)
                    
                    //4. draggable circle row
                    HStack {
                        ZStack(alignment: .center) {
                            Circle()
                                .fill(Color.colorRed)
                            Circle()
                                .fill(Color.black.opacity(0.2))
                                .padding(8.0)
                            Image(systemName: "chevron.right.2")
                                .foregroundStyle(.white)
                                .font(.system(size: 24.0, weight: .bold))
                        }.frame(width: 80.0, height: 80.0)
                            .offset(x: buttonOffset)
                            .gesture(
                                DragGesture().onChanged { gestureValue in
                                    if gestureValue.translation.width > 0 && buttonOffset <= buttonWidth - 80.0 {
                                        buttonOffset = gestureValue.translation.width
                                    }
                                }.onEnded { _ in
                                    if buttonOffset > buttonWidth / 2 {
                                        buttonOffset = buttonWidth - 80.0
                                        isOnboardingVisible.toggle()
                                        playSound(soundFile: "chimeup", fileType: "mp3")
                                        hapticFeedback.notificationOccurred(.success)
                                    } else {
                                        buttonOffset = 0.0
                                        hapticFeedback.notificationOccurred(.warning)
                                    }
                                }
                            )
                        Spacer()
                    }.frame(width: buttonWidth, height: 80.0)
                    
                }.frame(width: buttonWidth, height: 80.0)
                    .opacity(isAnimating ? 1.0 : 0.0)
                    .offset(y: isAnimating ? 0.0 : 40.0)
                    .animation(.easeOut(duration: 1.0), value: isAnimating)//: FOOTER BUTTON
                
                Spacer()
                
            }//: MAIN CONTENT
        }.onAppear {
            isAnimating.toggle()
        }.preferredColorScheme(.dark)
    }
}

#Preview {
    OnboardingView()
}
