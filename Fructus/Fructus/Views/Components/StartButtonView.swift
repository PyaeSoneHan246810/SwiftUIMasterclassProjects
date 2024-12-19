import SwiftUI

struct StartButtonView: View {
    //MARK: PROPERTIES
    var onClick: () -> Void = {}
    
    //MARK: BODY
    var body: some View {
        Button {
            onClick()
        } label: {
            HStack(spacing: 8.0) {
                Text("Start")
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }.padding(.horizontal, 16)
                .padding(.vertical, 10)
        }.tint(.white)
            .buttonBorderShape(.capsule)
            .overlay {
                Capsule().stroke(.white, lineWidth: 1.25)
            }
    }
}

//MARK: PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    StartButtonView()
        .preferredColorScheme(.dark)
        .padding()
}
