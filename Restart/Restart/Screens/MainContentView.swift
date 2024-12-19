import SwiftUI

struct MainContentView: View {
    @AppStorage("onboarding") private var isOnboardingVisible: Bool = true
    var body: some View {
        ZStack {
            if isOnboardingVisible {
                OnboardingView()
            } else {
                HomeView()
            }
        }.animation(.easeOut(duration: 0.5), value: isOnboardingVisible)
    }
}

#Preview {
    MainContentView()
}
