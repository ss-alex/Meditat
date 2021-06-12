//
//  PlayerPresenter.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/5/29.
//

import AVFoundation

protocol PlayerPresenterProtocol {
    init(view: PlayerViewInput)
    func initPlayerByUrl()
    func setSliderMaxValue()
    func addPlayerObserver()
    func setPlayerValueToZero()
    func setPlayerValueToTargetTime()
    func togglePlayerButton()
}

enum Urls: String {
    case sound = "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_1MG.mp3"
}

class PlayerPresenter: PlayerPresenterProtocol {
    var player: AVPlayer?
    unowned let view: PlayerViewInput
    
    private var overallDuration: Float64?
    private var currentTime: Float64?
    
    required init(view: PlayerViewInput) {
        self.view = view
    }
    
    func initPlayerByUrl() {
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
        
        overallDuration = seconds
    }
    
    func setSliderMaxValue() {
        guard let durationInSeconds = overallDuration else { return }
        self.view.setSliderMaxValue(seconds: durationInSeconds)
    }
    
    func addPlayerObserver() {
        player?.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, preferredTimescale: 1),
                                        queue: DispatchQueue.main,
                                        using: { [self] (CMTime) -> Void in
                                            if self.player?.currentItem?.status == .some(.readyToPlay) {
                                                let currentTime: Float64 = CMTimeGetSeconds((self.player?.currentTime())!)
                                                self.currentTime = currentTime
                                                self.view.setSliderCurrentValue(currentTime)
                                                //showNextScreen(_when: currentTime)
                                                
                                                let stringForCurrentTime = self.stringFromTimeInterval(interval: currentTime)
                                                self.view.setCurrentTimeLabelText(text: stringForCurrentTime)
                                            }
                                            
                                            let playbackLikelyToKeepUp = self.player?.currentItem?.isPlaybackLikelyToKeepUp
                                            if playbackLikelyToKeepUp == false {
                                                //print("IsBuffering")
                                            } else {
                                                //print("Buffering completed")
                                            }
                                        })
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidPlayToEnd), name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    private func stringFromTimeInterval(interval: TimeInterval) -> String {
        let interval = Int(interval)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600)
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func setPlayerValueToZero() {
        let targetTime: CMTime = CMTimeMake(value: 0, timescale: 1)
        player?.seek(to: targetTime)
        view.setSliderValueToZero()
        view.setButtonImageToPlay()
        
    }
    
    func setPlayerValueToTargetTime() {
        let value = self.view.showSliderTargetTimeInCMTime()
        player?.seek(to: value)
        
        if player?.rate == 0 {
            player?.play()
            self.view.setButtonImageToPause()
            
        }
    }
    
    func togglePlayerButton() {
        if player?.rate == 0 {
            player?.play()
            self.view.setButtonImageToPause()
        } else {
            player?.pause()
            self.view.setButtonImageToPlay()
        }
    }
    
    private func showNextScreen() {
        view.showCongratsScreen()
    }
    
    //MARK:- OBJC Methods
    
    @objc func playerDidPlayToEnd() {
        showNextScreen()
    }
}
