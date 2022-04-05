//
//  ViewController.swift
//  MyMusicPlayer
//
//  Created by Christianto Vinsen on 04/04/22.
//

import UIKit
import AVFoundation

class MusicViewController: UIViewController {
    /// Data
    var arrOfMusic: [Music] = []
    
    /// Data Control
    var currMusic = 0
    var currState = false
    
    /// Audio Player
    var player: AVAudioPlayer!
    
    var timer: Timer?

    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelAlbum: UILabel!
    @IBOutlet weak var textLyrics: UITextView!
    
    @IBOutlet weak var buttonPlayPause: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var buttonPrev: UIButton!
    @IBOutlet weak var buttonFavorite: UIButton!
    @IBOutlet weak var labelStartTime: UILabel!
    @IBOutlet weak var labelEndTime: UILabel!
    @IBOutlet weak var sliderDuration: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Insert music
        arrOfMusic = MusicSeeder.init().arrOfMusic
        
        // Pre load default song
        loadCurrentMusic()
    }
    
    func loadCurrentMusic() {
        let music: Music = arrOfMusic[currMusic]
        
        imgCover.image = music.image
        labelTitle.text = music.title
        labelAlbum.text = music.singer
        textLyrics.text = music.lyrics
        labelStartTime.text = music.formattedTime(time: music.startTime)
        labelEndTime.text = music.formattedTime(time: music.endTime)
        sliderDuration.minimumValue = Float(music.startTime)
        sliderDuration.maximumValue = Float(music.endTime)
        
        var imageFavorite = UIImage(systemName: "heart")
        if music.isFavorite {
            imageFavorite = UIImage(systemName: "heart.fill")
        }
        buttonFavorite.setImage(imageFavorite, for: .normal)
        
        initSound(music)
    }
    
    
    @IBAction func buttonPlayPauseClicked(_ sender: Any) {
        print("play pause")
        var image: UIImage?
        if currState {
            /// Now paused
            image = UIImage(systemName: "play.fill")
            pauseSound()
        } else {
            /// Now playing
            image = UIImage(systemName: "pause.fill")
            playSound()
        }
        buttonPlayPause.setImage(image, for: .normal)
        currState = !currState
    }
    @IBAction func buttonNextClicked(_ sender: Any) {
        sliderDuration.value = 0
        print("next")
        if currMusic + 1 == arrOfMusic.count {
            currMusic = 0
        } else {
            currMusic += 1
        }
        
        stopSound()
        loadCurrentMusic()
        playSound()
    }
    @IBAction func buttonPrevClicked(_ sender: Any) {
        sliderDuration.value = 0
        
        print("prev")
        if currMusic == 0 {
            currMusic = arrOfMusic.count - 1
        } else {
            currMusic -= 1
        }
        
        stopSound()
        loadCurrentMusic()
        playSound()
    }
    
    func initSound(_ music: Music) {
        guard let url = Bundle.main.url(forResource: music.filename, withExtension: music.filetype) else {
            print("music file notfound")
            return
            
        }
        print(url)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch let error {
            print("SOME ERROR")
            print(error)
        }
        
    }
    
    func playSound() {
        if player != nil {
            player.play()
        }
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    func pauseSound() {
        if player != nil {
            player.pause()
        }
        
        timer?.invalidate()
    }
    
    func stopSound() {
        arrOfMusic[currMusic].startTime = 0
        
        if player != nil {
            player.stop()
            player = nil
        }
    }
    
    @objc func updateCounter() {
        arrOfMusic[currMusic].startTime += 1
        if arrOfMusic[currMusic].startTime > arrOfMusic[currMusic].endTime {
            arrOfMusic[currMusic].startTime = 0
        }
        
        sliderDuration.value = Float(arrOfMusic[currMusic].startTime)
        labelStartTime.text = arrOfMusic[currMusic].formattedTime(time: arrOfMusic[currMusic].startTime)
    }
    @IBAction func sliderDurationOnChanged(_ sender: UISlider) {
        player.currentTime = Double(sender.value)
        player.play()
        arrOfMusic[currMusic].startTime = Int(sender.value)
        labelStartTime.text = arrOfMusic[currMusic].formattedTime(time: Int(sender.value))
    }
    
    @IBAction func buttonFavoriteOnClicked(_ sender: UIButton) {
        var imageFavorite : UIImage?
        if arrOfMusic[currMusic].isFavorite {
            arrOfMusic[currMusic].isFavorite = false
            imageFavorite = UIImage(systemName: "heart")
        } else {
            arrOfMusic[currMusic].isFavorite = true
            imageFavorite = UIImage(systemName: "heart.fill")
        }
        
        buttonFavorite.setImage(imageFavorite, for: .normal)
    }
}

