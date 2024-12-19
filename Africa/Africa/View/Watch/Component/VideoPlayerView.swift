//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Dylan on 05/12/2024.
//
import AVKit
import SwiftUI

struct VideoPlayerView: View {
    // MARK: - PROPERTIES
    let videoId: String
    let videoTitle: String
    // MARK: - BODY
    var body: some View {
        VideoPlayer(
            player: playVideo(fileName: videoId, fileFormat: "mp4")
        ).overlay(alignment: .topTrailing) {
            Image(.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 32.0, height: 32.0)
                .padding(.top, 6.0)
                .padding(.trailing, 8.0)
        }.navigationTitle(videoTitle)
            .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    let video: Video = videos.randomElement()!
    let videoId: String = video.id
    let videoTitle: String = video.name
    NavigationView {
        VideoPlayerView(
            videoId: videoId,
            videoTitle: videoTitle
        )
    }
}
