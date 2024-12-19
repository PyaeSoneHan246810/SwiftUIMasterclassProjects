//
//  WatchView.swift
//  Africa
//
//  Created by Dylan on 04/12/2024.
//

import SwiftUI

struct WatchView: View {
    // MARK: - PROPERTIES
    @State private var videos: [Video] = Bundle.main.decode(from: "videos.json")
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    VideoListItemView(
                        video: video
                    ).background(
                        NavigationLink {
                            VideoPlayerView(
                                videoId: video.id,
                                videoTitle: video.name
                            )
                        } label: {}
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .opacity(0.0)
                    )
                }.listRowSeparator(.hidden)
            }
            .navigationTitle("Videos")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticFeedback.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    WatchView()
}
