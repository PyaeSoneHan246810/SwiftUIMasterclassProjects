import SwiftUI

struct SettingsRowView: View {
    //MARK: PROPPERTIES
    var name: String
    var content: String?
    var linkLabel: String?
    var linkDestination: String?
    //MARK: BODY
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 4.0)
            HStack {
                Text(name)
                    .foregroundStyle(.secondary)
                Spacer()
                if (content != nil) {
                    Text(content!)
                        .foregroundStyle(.primary)
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(
                        destination: URL(string: linkDestination!)!
                    ) {
                        Text(linkLabel!)
                            .foregroundStyle(.primary)
                        Image(systemName: "arrow.up.right.square")
                            .foregroundStyle(.pink)
                    }
                } else {
                    EmptyView()
                }
            }
        }
    }
}

//MARK: PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    Group {
        SettingsRowView(
            name: "Developer",
            content: "Pyae Sone Han"
        ).preferredColorScheme(.dark)
        SettingsRowView(
            name: "Language",
            linkLabel: "Swift",
            linkDestination: "https://www.swift.org/"
        ).preferredColorScheme(.dark)
    }
}
