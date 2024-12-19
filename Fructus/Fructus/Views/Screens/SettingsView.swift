import SwiftUI

struct SettingsView: View {
    //MARK: PROPERTIES
    @Environment(\.dismiss) var dismiss
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = true
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(alignment: .center, spacing: 24.0) {
                    //MARK: Section 1
                    GroupBox {
                        Divider()
                            .padding(.vertical, 4.0)
                        HStack(spacing: 10.0) {
                            Image(.logo)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80.0, height: 80.0)
                                .cornerRadius(10.0)
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity)
                                .lineSpacing(-1.0)
                        }.padding(.vertical, 8.0)
                    } label: {
                        SettingsLabelView(
                            title: "Fructus",
                            symbol: "info.circle"
                        )
                    }
                    //MARK: Section 2
                    GroupBox {
                        Divider()
                            .padding(.vertical, 4.0)
                        VStack(spacing: 16.0) {
                            Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                                .lineSpacing(-1.0)
                            Toggle(
                                isOn: Binding<Bool>(
                                    get: {
                                        !isOnboardingComplete
                                    },
                                    set: { value, _ in
                                        isOnboardingComplete = !value
                                    }
                                )
                            ) {
                                if !isOnboardingComplete {
                                    Text("Restarted".uppercased())
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color.green)
                                } else {
                                    Text("Restart".uppercased())
                                        .fontWeight(.bold)
                                        .foregroundStyle(.secondary)
                                }
                            }.padding()
                                .background(
                                    Color(.tertiarySystemBackground)
                                        .clipShape(.rect(cornerRadius: 8.0))
                                )
                        }.padding(.vertical, 8.0)
                    } label: {
                        SettingsLabelView(
                            title: "Customization",
                            symbol: "paintbrush"
                        )
                    }
                    //MARK: Section 3
                    GroupBox {
                        SettingsRowView(
                            name: "Developer",
                            content: "Pyae Sone Han"
                        )
                        SettingsRowView(
                            name: "Designer",
                            content: "Robert Petras"
                        )
                        SettingsRowView(
                            name: "Compatibility",
                            content: "iOS 18.0"
                        )
                        SettingsRowView(
                            name: "Website",
                            linkLabel: "SwiftUI Masterclass",
                            linkDestination: "https://swiftuimasterclass.com/"
                        )
                        SettingsRowView(
                            name: "SwiftUI",
                            content: "5.0"
                        )
                        SettingsRowView(
                            name: "Version",
                            content: "1.1.0"
                        )
                    } label: {
                        SettingsLabelView(
                            title: "Application",
                            symbol: "iphone"
                        )
                    }
                }.padding(.horizontal, 20.0)
                    .padding(.vertical, 20.0)
            }.navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
        }
    }
}

//MARK: PREVIEW
#Preview {
    SettingsView()
        .preferredColorScheme(.dark)
}
