//
//  PlayerVC.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/3/15.
//

import UIKit
import AVFoundation
import Firebase

class PlayerVC: UIViewController {
    
    //var player: AVAudioPlayer?
    var player: AVPlayer?
    
    private let playerButton = UIButton()
    
    //let cache = NSCache<NSString, AVFileType>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupPlayerButton()
    }
    
    private func setupUI() {
        view.backgroundColor = .gray
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
        playerButton.addTarget(self, action: #selector(playAudio), for: .touchUpInside)
    }
    
    @objc func playAudio() {
        /*if let player = player, player.isPlaying {
            player.stop()
            
        } else {
            
            let urlString = "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_1MG.mp3"
            //let url = URL(string: urlString)
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                //guard let url = url else { return }
                //player = try AVAudioPlayer(contentsOf: url)
                
                //guard let player = player else { return }
                //player.play()
                
            } catch {
                print("something went wrong")
            }
        }*/
        
        /*let urlString = "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_1MG.mp3"
        let storage = Storage.storage().reference(forURL: urlString)
        storage.downloadURL { (url, error) in
            if error != nil {
                print(error)
            } else {
                self.player = AVPlayer(playerItem: AVPlayerItem(url: url!))
                self.player?.play()
            }
        }*/
        let urlString = "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_1MG.mp3"
        //let urlString = "gs://meditat-3a91c.appspot.com/Audios/birds.wav"
        let url = URL(string: urlString)
        self.player = AVPlayer(playerItem: AVPlayerItem(url: url!))
        self.player?.play()
        print("player is set to play")
    }
    
    /*private func downloadFileFromURL(url: URL) {
        var downloadTask: URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: url, completionHandler: { (url, response, error) in
            
        })
    }*/
    
    /*func downloadAudio(from urlString: String, completed: @escaping (AVAudioFile) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let audio = cache.object(forKey: cacheKey) {
            completed(audio)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed()
            return
        }
        
        
        
    }*/
    
}
