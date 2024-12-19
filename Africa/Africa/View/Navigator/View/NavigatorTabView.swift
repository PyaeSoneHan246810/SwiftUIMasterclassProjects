//
//  NavigatorTabView.swift
//  Africa
//
//  Created by Dylan on 04/12/2024.
//

import SwiftUI

struct NavigatorTabView: View {
    // MARK: - PROPERTIES
    // MARK: - BODY
    var body: some View {
        TabView {
            BrowseView().tabItem {
                Label(
                    "Browse",
                    systemImage: "square.grid.2x2"
                )
            }
            WatchView().tabItem {
                Label(
                    "Watch",
                    systemImage: "play.rectangle"
                )
            }
            MapView().tabItem {
                Label(
                    "Map",
                    systemImage: "location"
                )
            }
            GalleryView().tabItem {
                Label(
                    "Gallery",
                    systemImage: "photo"
                )
            }
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    NavigatorTabView()
}
