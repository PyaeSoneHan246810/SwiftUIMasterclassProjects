import SwiftUI

@main
struct TouchDownApp: App {
    var body: some Scene {
        WindowGroup {
            AppContentView()
                .environmentObject(Shop())
        }
    }
}
