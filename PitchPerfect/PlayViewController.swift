//
//  PlayViewController.swift
//  PitchPerfect
//
//  Created by NgVTam on 26/02/2021.
//

import UIKit
import AVFoundation

class PlayViewController: UIViewController {
    
//    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
//    var soundPlayer: AVAudioPlayer!
//    var playFileName: String = RecordViewController().fileName
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("Play Sound Button Pressed")
        
        switch sender {
        case slowButton:
            playSound(rate: 0.5)

        case fastButton:
            playSound(rate: 1.5)

        case highButton:
            playSound(pitch: 1000)

        case lowButton:
            playSound(pitch: -1000)

        case echoButton:
            playSound(echo: true)

        case reverbButton:
            playSound(reverb: true)
        default:
            print("Default Switch")
        }
        
        configureUI(.playing)

    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        print("Stop Audio Button Pressed")
        stopAudio()
    }
    
    
//    func getDocumentsDirector() -> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        return paths[0]
//    }
////
//    func setupPlayer() {
//        let audioFileName = getDocumentsDirector().appendingPathComponent(playFileName)
//
//        do {
//            try soundPlayer = AVAudioPlayer(contentsOf: audioFileName)
//            soundPlayer.delegate = self
//            soundPlayer.prepareToPlay()
//            soundPlayer.volume = 1.0
//        } catch {
//            print("Setup Player ERROR")
//        }
//
//    }
    
//    @IBAction func playAction(_ sender: Any) {
//        print("Play Action")
        
//        setupPlayer()
//
//        if soundPlayer != nil {
//            soundPlayer.play()
//
//        } else {
//            print("Sound Player is NULL")
//        }
        
//    }
    

}
