import SwiftUI

struct CustomListRowView: View {
    let rowLabel: String
    let rowIcon: String
    let rowIconBackgroundColor: Color
    var rowContent: String? = nil
    var rowLinkLable: String? = nil
    var rowLinkDestination: String? = nil
    var body: some View {
        LabeledContent {
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundStyle(.primary)
                    .fontWeight(.bold)
            } else if rowLinkLable != nil && rowLinkDestination != nil {
                Link(rowLinkLable!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundStyle(.pink)
                    .fontWeight(.semibold)
            } else {
                EmptyView()
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8.0)
                        .frame(width: 30.0, height: 30.0)
                        .foregroundStyle(rowIconBackgroundColor)
                    Image(systemName: rowIcon)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
                    .font(.headline)
                    .fontWeight(.medium)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CustomListRowView(
        rowLabel: "Application",
        rowIcon: "apps.iphone",
        rowIconBackgroundColor: Color.blue,
        rowContent: "Hike"
    )
}
#Preview(traits: .sizeThatFitsLayout) {
    CustomListRowView(
        rowLabel: "Website",
        rowIcon: "globe",
        rowIconBackgroundColor: Color.indigo,
        rowLinkLable: "Credo Academy",
        rowLinkDestination: "https://credo.academy"
    )
}
