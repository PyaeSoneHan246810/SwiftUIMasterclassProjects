//
//  VideoListItemView.swift
//  Africa
//
//  Created by Dylan on 05/12/2024.
//

import SwiftUI

struct VideoListItemView: View {
    // MARK: - PROPERTIES
    let video: Video
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 10.0) {
            Image(video.videoThumbnil)
                .resizable()
                .scaledToFit()
                .frame(height: 80.0)
                .overlay(alignment: .center) {
                    Image(systemName: "play.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32.0, height: 32.0)
                        .shadow(radius: 4.0)
                }
                .clipShape(.rect(cornerRadius: 8.0))
            VStack(alignment: .leading, spacing: 8.0) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }.frame(maxWidth: .infinity, alignment: .leading)
        }.frame(maxWidth: .infinity)
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    let video = videos.randomElement()!
    VideoListItemView(
        video: video
    )
}
