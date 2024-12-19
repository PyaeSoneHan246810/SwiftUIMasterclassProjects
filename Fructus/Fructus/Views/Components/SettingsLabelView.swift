import SwiftUI

struct SettingsLabelView: View {
    //MARK: PROPERTIES
    var title: String = "Settings"
    var symbol: String = "info.circle"
    //MARK: BODY
    var body: some View {
        HStack {
            Text(title.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: symbol)
        }
    }
}

//MARK: PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    SettingsLabelView()
        .preferredColorScheme(.dark)
        .padding()
}
