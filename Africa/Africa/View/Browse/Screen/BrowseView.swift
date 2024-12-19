//
//  BrowseView.swift
//  Africa
//
//  Created by Dylan on 04/12/2024.
//

import SwiftUI

struct BrowseView: View {
    // MARK: - PROPERTIES
    @AppStorage("isGridViewActive") private var isGridViewActive: Bool = false
    @AppStorage("browseGridColumnCount") private var gridColumnCount: Int = 1
    @AppStorage("browseGridIcon") private var gridIconImage: String = "rectangle.grid.1x2"
    var gridItems: [GridItem] {
        return Array(
            repeating: GridItem(.flexible(), spacing: 12.0),
            count: gridColumnCount
        )
    }
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImagesTabView(
                            coverImages: coverImages
                        ).frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                        ForEach(animals) { animal in
                            AnimalListItemView(animal: animal)
                                .background {
                                    NavigationLink {
                                        AnimalDetailView(
                                            animal: animal
                                        )
                                    } label: {}.frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .opacity(0.0)
                                }
                        }.listRowInsets(EdgeInsets(top: 0.0, leading: 12.0, bottom: 0.0, trailing: 12.0))
                        CreditsView()
                            .modifier(CenterModifier())
                    }.listStyle(.plain)
                        .listRowSpacing(12.0)
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridItems, spacing: 12.0) {
                            ForEach(animals) { animal in
                                NavigationLink {
                                    AnimalDetailView(
                                        animal: animal
                                    )
                                } label: {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }.padding(12.0)
                        CreditsView()
                    }
                }
            }.navigationTitle("Africa")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isGridViewActive = false
                            hapticFeedback.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(
                                    isGridViewActive ? Color.primary : Color.accentColor
                                )
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isGridViewActive = true
                            switchGridColumn()
                            hapticFeedback.impactOccurred()
                        } label: {
                            Image(systemName: gridIconImage)
                                .font(.title2)
                                .foregroundStyle(
                                    isGridViewActive ? Color.accentColor : Color.primary
                                )
                        }
                    }
                }
        }
    }
    // MARK: - FUNCTIONS
    private func switchGridColumn() {
        gridColumnCount = gridItems.count % 3 + 1
        switch gridColumnCount {
        case 1:
            gridIconImage = "rectangle.grid.1x2"
        case 2:
            gridIconImage = "square.grid.2x2"
        case 3:
            gridIconImage = "rectangle.grid.3x3"
        default:
            gridIconImage = "rectangle.grid.1x2"
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    BrowseView()
}
