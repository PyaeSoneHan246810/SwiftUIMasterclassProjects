import SwiftUI

struct SourceLinkView: View {
    //MARK: BODY
    var body: some View {
        GroupBox {
            HStack {
                Text("Content Source")
                Spacer()
                Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)
                Image(systemName: "arrow.up.right.square")
                    .font(.footnote)
            }
        }
    }
}

//MARK: PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    SourceLinkView()
        .preferredColorScheme(.dark)
        .padding()
}
