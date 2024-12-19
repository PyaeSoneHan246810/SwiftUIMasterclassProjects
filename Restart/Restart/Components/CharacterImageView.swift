import SwiftUI

struct CharacterImageView: View {
    var imageResource: ImageResource
    var body: some View {
        Image(imageResource)
            .resizable()
            .scaledToFit()
            .frame(width: 380.0, height: 380.0, alignment: .center)
    }
}

#Preview {
    CharacterImageView(
        imageResource: .character2
    )
}
