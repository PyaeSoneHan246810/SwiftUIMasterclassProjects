import SwiftUI

struct FruitsListView: View {
    //MARK: PROPERTIES
    var fruits: [Fruit] = fruitsData.shuffled()
    @State private var isSettingsSheetPresented: Bool = false
    @State private var selectedFruit: Fruit? = nil
    
    //MARK: BODY
    var body: some View {
        NavigationSplitView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 12.0) {
                    ForEach(fruits) { fruit in
                        VStack {
                            NavigationLink(value: fruit) {
                                FruitRowView(fruit: fruit)
                            }
                            if fruit.id != fruits.last?.id {
                                ListSeperator()
                            }
                        }
                    }
                }.padding(.horizontal, 12.0)
                    .padding(.vertical, 12.0)
                    .onAppear {
                        selectedFruit = fruits.first!
                    }
            }.navigationTitle("Fruits")
                .navigationBarTitleDisplayMode(.large)
                .navigationDestination(for: Fruit.self) { fruit in
                    FruitDetailView(fruit: fruit)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isSettingsSheetPresented.toggle()
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                        }
                    }
                }
                .sheet(isPresented: $isSettingsSheetPresented) {
                    SettingsView()
                }
        } detail: {
            if let selectedFruit {
                FruitDetailView(fruit: selectedFruit)
            }
        }
    }
}

//MARK: PREVIEW
#Preview {
    FruitsListView()
        .preferredColorScheme(.dark)
}
