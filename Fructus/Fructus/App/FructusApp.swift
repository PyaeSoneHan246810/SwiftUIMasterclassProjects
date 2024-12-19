import SwiftUI

@main
struct FructusApp: App {
    //MARK: PROPERTIES
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    
    //MARK: BODY
    var body: some Scene {
        WindowGroup {
            if isOnboardingComplete {
                FruitsListView()
            } else {
                OnboardingView()
            }
        }
    }
}
