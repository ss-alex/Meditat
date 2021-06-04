//
//  PlayerVC.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/3/15.
//

import UIKit
import AVFoundation
import Firebase

//сверстать дами экран (кнопка плей и стоп)
//два текст филда для вывода времени: время текущее / время полное
//слайдер для перемотки времени
//второе: внутри логика:
//проигрывание плей/стоп аудио
//текущее время проигрывания связано с реальным временем, сколько было проиграно
//слайдер связан логикой с плеером и временем
//все проициаилазировано отдельными методами через viewDidLoad()

// logics (step 1):
// stop / play song
// retrieve song (inside presenter)

protocol PlayerViewInput: class {
    func setCurrentTimeLabelText(text: String)
    func setOverallDurationLabel(text: String)
}

class PlayerVC: UIViewController {
    
    private let playerButton = UIButton()
    private let currentTimeLabel = UILabel()
    private let overallDurationLabel = UILabel()
    
    var presenter: PlayerPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PlayerPresenter(view: self)
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .gray
        setupPlayerButton()
        setupCurrentTimeLabel()
        setupOverallDurationLabel()
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
        playerButton.addTarget(self, action: #selector(playButtonPushed), for: .touchUpInside)
    }
    
    @objc func playButtonPushed() {
        presenter.initAudioPlayerByUrl()
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
}

extension PlayerVC: PlayerViewInput {
    
    func setCurrentTimeLabelText(text: String) {
        currentTimeLabel.text = text
    }
    
    func setOverallDurationLabel(text: String) {
        overallDurationLabel.text = text
    }
}


