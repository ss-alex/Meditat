//
//  PlayerPresenter.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/5/29.
//

import Foundation
import UIKit
import AVFoundation

protocol PlayerPresenterProtocol {
    init(view: PlayerViewInput)
    func initAudioPlayerByUrl()
}

enum Urls: String {
    case sound = "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_1MG.mp3"
}

class PlayerPresenter: PlayerPresenterProtocol {
    var player: AVPlayer?
    unowned let view: PlayerViewInput
    
    required init(view: PlayerViewInput) {
        self.view = view
    }
    
    func initAudioPlayerByUrl() {
        print("Presenter fetch sound from url and play it.")
        
        let urlString = Urls.sound
        guard let url = URL(string: urlString.rawValue) else { return }
        
        let playerItem: AVPlayerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        
        let duration: CMTime = playerItem.asset.duration
        let seconds: Float64 = CMTimeGetSeconds(duration)
        self.view.setOverallDurationLabel(text: String(seconds))
        
        let currentDuration: CMTime = playerItem.currentTime()
        let currentSeconds: Float64 = CMTimeGetSeconds(currentDuration)
        self.view.setCurrentTimeLabelText(text: String(currentSeconds))
    }
}

/*private let url = "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_1MG.mp3"
private var isPlayerSetToPlay: Bool = false*/

///******
//private var audioPlayer: AVAudioPlayer?

/*@objc func play2() {
    
}

private func checkIfFileExists(with link: String, completion: @escaping ((_ filePath: URL) -> Void)) {
    let urlString = link.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
    
}

private func play(URL: URL) {
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL, fileTypeHint: .none)
        audioPlayer?.prepareToPlay()
        audioPlayer?.delegate = self
        audioPlayer?.play()
    } catch {
        audioPlayer = nil
    }
}*/
