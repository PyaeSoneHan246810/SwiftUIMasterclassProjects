import SwiftUI

struct HomeView: View {
    @State private var isSheetPresented: Bool = false
    var body: some View {
        NavigationStack {
            CustomCardView(
                onCustomButtonClick: {
                    isSheetPresented.toggle()
                }
            ).sheet(isPresented: $isSheetPresented) {
                SettingsView()
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

#Preview {
    HomeView()
}
