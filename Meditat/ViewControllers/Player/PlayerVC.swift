//
//  PlayerVC.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/3/15.
//

import UIKit
import AVFoundation

protocol PlayerViewInput: class {
    func setCurrentTimeLabelText(text: String)
    func setOverallDurationLabel(text: String)
    func setSliderMaxValue(seconds: Float64)
    func setSliderCurrentValue(_ value: Float64)
    func setSliderValueToZero()
    func showSliderTargetTimeInCMTime() -> CMTime
    func setButtonImageToPlay()
    func setButtonImageToPause()
    func showCongratsScreen()
}

class PlayerVC: UIViewController {
    
    private let currentTimeLabel = UILabel()
    private let overallDurationLabel = UILabel()
    private let playbackSlider = UISlider()
    private let playerButton = UIButton()
    var playerItem: AVPlayerItem?
    
    var presenter: PlayerPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLogic()
    }
    
    private func setupLogic() {
        presenter = PlayerPresenter(view: self)
        presenter.initPlayerByUrl()
        presenter.setSliderMaxValue()
        presenter.addPlayerObserver()
    }
    
    private func setupUI() {
        view.backgroundColor = .gray
        setupCurrentTimeLabel()
        setupOverallDurationLabel()
        setupPlaybackSlider()
        setupPlayerButton()
    }
    
    private func setupCurrentTimeLabel() {
        view.addSubview(currentTimeLabel)
        currentTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            currentTimeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            currentTimeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            currentTimeLabel.heightAnchor.constraint(equalToConstant: 40),
            currentTimeLabel.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        currentTimeLabel.backgroundColor = .systemBlue
    }
    
    private func setupOverallDurationLabel() {
        view.addSubview(overallDurationLabel)
        overallDurationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            overallDurationLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            overallDurationLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            overallDurationLabel.heightAnchor.constraint(equalToConstant: 40),
            overallDurationLabel.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        overallDurationLabel.backgroundColor = .systemBlue
    }
    
    private func setupPlaybackSlider() {
        view.addSubview(playbackSlider)
        playbackSlider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playbackSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            playbackSlider.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            playbackSlider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            playbackSlider.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        playbackSlider.backgroundColor = .systemBackground
        playbackSlider.addTarget(self, action: #selector(playbackSliderValueChanged(_:)), for: .valueChanged)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.finishedPlaying(_:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: playerItem)
    }
    
    @objc func playbackSliderValueChanged(_ playbackSlider: UISlider) {
        presenter.setPlayerValueToTargetTime()
    }
    
    @objc func finishedPlaying(_ myNotification: NSNotification) {
        presenter.setPlayerValueToZero()
    }
    
    private func setupPlayerButton() {
        view.addSubview(playerButton)
        playerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            playerButton.widthAnchor.constraint(equalToConstant: 100),
            playerButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        playerButton.backgroundColor = .systemPink
        playerButton.addTarget(self, action: #selector(togglePlayerButton), for: .touchUpInside)
        setButtonImageToPlay()
    }
    
    @objc func togglePlayerButton() {
        presenter.togglePlayerButton()
    }
}

extension PlayerVC: PlayerViewInput {
    
    func setCurrentTimeLabelText(text: String) {
        currentTimeLabel.text = text
    }
    
    func setOverallDurationLabel(text: String) {
        overallDurationLabel.text = text
    }
    
    func setSliderMaxValue(seconds: Float64) {
        playbackSlider.maximumValue = Float(seconds)
        playbackSlider.isContinuous = true
    }
    
    func setSliderCurrentValue(_ value: Float64) {
        playbackSlider.value = Float(value)
    }
    
    func setSliderValueToZero() {
        playbackSlider.value = .zero
    }
    
    /// show the slider current time in CMTime format
    func showSliderTargetTimeInCMTime() -> CMTime {
        let seconds: Int64 = Int64(playbackSlider.value)
        let targetTime: CMTime = CMTimeMake(value: seconds, timescale: 1)
        return targetTime
    }
    
    func setButtonImageToPlay() {
        playerButton.setImage(UIImage(systemName: "play"), for: .normal)
    }
    
    func setButtonImageToPause() {
        playerButton.setImage(UIImage(systemName: "pause"), for: .normal)
    }
    
    func showCongratsScreen() {
        let entity = presenter.entity
        navigationController?.pushViewController(CongratsVC(entity: entity), animated: true)
    }
}


