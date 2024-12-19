import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(soundFile: String, fileType: String) {
    if let soundFilePath = Bundle.main.path(forResource: soundFile, ofType: fileType) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: soundFilePath))
            audioPlayer?.play()
        } catch {
            print("Couldn't play the sound file.")
        }
    }
}
