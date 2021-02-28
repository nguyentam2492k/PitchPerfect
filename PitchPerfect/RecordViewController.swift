//
//  RecordViewController.swift
//  PitchPerfect
//
//  Created by NgVTam on 05/02/2021.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    
//    var soundRecorder : AVAudioRecorder!
//    var fileName : String = "audioFile"

    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false
        
//        setupRecorder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        print("viewWillAppearCalled")
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
//        print("viewDidAppearCalled")
        super.viewDidAppear(animated)
    }
    
    @IBAction func recordAudio(_ sender: Any) {
        
//        soundRecorder.record()
        
        stopRecordingButton.isEnabled = true
        recordButton.isEnabled = false
        recordingLabel.text = "Recording in Progress..."
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
    
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        audioRecorder.delegate = self

        
    }
    
    @IBAction func stopRecordinng(_ sender: Any) {
        
//        soundRecorder.stop()
//        print(soundRecorder.url)
        
        recordButton.isEnabled = true
        stopRecordingButton.isEnabled = false
        recordingLabel.text = "Complete. Tap to Record again"
        
        audioRecorder.stop()
            let audioSession = AVAudioSession.sharedInstance()
            try! audioSession.setActive(false)
        
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("Recording was not successfull")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playViewController = segue.destination as! PlayViewController
            let recordedAudioURL = sender as! URL
            playViewController.recordedAudioURL = recordedAudioURL
        }
    }
    
    //lay duong dan den file lay am thanh
//    func getDocumentsDirector() -> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        return paths[0]
//    }
//
//    func setupRecorder() {
//        let audioFileName = getDocumentsDirector().appendingPathComponent(fileName)
//        let recordSetting = [ AVFormatIDKey : kAudioFormatAppleLossless,
//                              AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
//                              AVEncoderBitRateKey : 32000,
//                              AVNumberOfChannelsKey : 2,
//                              AVSampleRateKey : 44100.2
//                            ] as [String : Any]
//
//        do {
//            soundRecorder = try AVAudioRecorder(url: audioFileName, settings: recordSetting)
//            soundRecorder.delegate = self
//            soundRecorder.prepareToRecord()
//        } catch {
//            print("Setup Recorder ERROR")
//        }
//
//    }
    
//    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
//        stopRecordingButton.isEnabled = false
//    }
    
    
}

