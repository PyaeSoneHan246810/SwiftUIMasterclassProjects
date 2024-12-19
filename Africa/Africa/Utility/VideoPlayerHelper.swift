//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Dylan on 05/12/2024.
//

import AVKit
import Foundation

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
        videoPlayer = AVPlayer(url: url)
        videoPlayer?.play()
    }
    return videoPlayer
}
