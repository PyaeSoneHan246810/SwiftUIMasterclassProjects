import SwiftUI

struct SettingsView: View {
    private let appIcons: [String] = [
        "AppIcon-Backpack",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-Map",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Mushroom"
    ]
    var body: some View {
        List {
            //header section
            Section {
                VStack(spacing: 16.0) {
                    HStack {
                        Spacer()
                        Image(systemName: "laurel.leading")
                            .font(.system(size: 80.0, weight: .black))
                        VStack(spacing: -10.0) {
                            Text("Hike")
                                .font(.system(size: 66.0, weight: .black))
                            Text("Editors' Choice")
                        }
                        Image(systemName: "laurel.trailing")
                            .font(.system(size: 80.0, weight: .black))
                        Spacer()
                    }.frame(maxWidth: .infinity)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.customGreenLight, .customGreenMedium, .customGreenDark],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    VStack(spacing: 8.0) {
                        Text("Where can you find\n perfect tracks?")
                            .font(.title2)
                            .fontWeight(.heavy)
                        Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                            .font(.footnote)
                            .italic()
                        Text("Dust off the boots! It's time for a walk.")
                            .fontWeight(.heavy)
                            .foregroundStyle(
                                Color.customGreenMedium
                            )
                    }.frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                }.frame(maxWidth: .infinity)
                    .padding(.vertical, 8.0)
            }.listRowSeparator(.hidden)
            //alternate icons section
            Section(
                header: Text("Alternate icons".uppercased())
            ) {
                VStack(spacing: 16.0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 12.0) {
                            ForEach(appIcons, id: \.self) { appIcon in
                                Button {
                                    //change app icon
                                    Task {
                                        do {
                                            try await UIApplication.shared.setAlternateIconName(appIcon)
                                        } catch {
                                            print(error.localizedDescription)
                                        }
                                    }
                                } label: {
                                    Image("\(appIcon)-Preview")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .clipShape(.rect(cornerRadius: 16))
                                }.buttonStyle(.borderless)
                            }
                        }
                    }.frame(maxWidth: .infinity)
                    Text("Choose your favorite app icon from the collection above")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }.frame(maxWidth: .infinity)
                    .padding(.vertical, 8.0)
            }.listRowSeparator(.hidden)
            //about app section
            Section(
                header: Text("About the app".uppercased()),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All rights reserved.")
                    Spacer()
                }.padding(.vertical, 8.0)
            ) {
                VStack(spacing: 16.0) {
                    CustomListRowView(
                        rowLabel: "Application",
                        rowIcon: "apps.iphone",
                        rowIconBackgroundColor: Color.blue,
                        rowContent: "Hike"
                    ).frame(maxWidth: .infinity)
                    CustomListRowView(
                        rowLabel: "Compatibility",
                        rowIcon: "info.circle",
                        rowIconBackgroundColor: Color.red,
                        rowContent: "iOS, iPadOS"
                    ).frame(maxWidth: .infinity)
                    CustomListRowView(
                        rowLabel: "Technology",
                        rowIcon: "swift",
                        rowIconBackgroundColor: Color.orange,
                        rowContent: "SwiftUI"
                    ).frame(maxWidth: .infinity)
                    CustomListRowView(
                        rowLabel: "Version",
                        rowIcon: "gear",
                        rowIconBackgroundColor: Color.orange,
                        rowContent: "1.0"
                    ).frame(maxWidth: .infinity)
                    CustomListRowView(
                        rowLabel: "Developer",
                        rowIcon: "ellipsis.curlybraces",
                        rowIconBackgroundColor: Color.mint,
                        rowContent: "Pyae Sone Han"
                    ).frame(maxWidth: .infinity)
                    CustomListRowView(
                        rowLabel: "Designer",
                        rowIcon: "paintpalette",
                        rowIconBackgroundColor: Color.pink,
                        rowContent: "Robert Petras"
                    ).frame(maxWidth: .infinity)
                    CustomListRowView(
                        rowLabel: "Website",
                        rowIcon: "globe",
                        rowIconBackgroundColor: Color.indigo,
                        rowLinkLable: "Credo Academy",
                        rowLinkDestination: "https://credo.academy"
                    ).frame(maxWidth: .infinity)
                }.frame(maxWidth: .infinity)
                    .padding(.vertical, 8.0)
            }.listRowSeparator(.hidden)
        }
    }
}

#Preview {
    SettingsView()
}
