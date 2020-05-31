//
//  ViewController.swift
//  music player Back
//
//  Created by Hoang Vo on 5/31/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var playerSong = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "Prisoner", ofType: "mp3")
    //set up timer to move the timeSlider when the song plays
    var timer = Timer()

    
    @objc func updateTimeSlider(){
        timeSlider.value = Float(playerSong.currentTime)
        
    }
    @IBAction func play(_ sender: UIBarButtonItem) {
        playerSong.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimeSlider), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func pause(_ sender: UIBarButtonItem) {
        playerSong.pause()
        timer.invalidate()
    }
    
    
    @IBAction func stop(_ sender: UIBarButtonItem) {
        //playerSong.stop()
        timeSlider.value = 0
        timer.invalidate()
        playerSong.pause()
        do {
            
            try playerSong = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))

            
        } catch {
            
            // Process any errors
            
        }
        
    }
    
    @IBAction func soundSliderMove(_ sender: UISlider) {
        playerSong.volume = soundSlider.value
    }
    
    
    @IBOutlet weak var soundSlider: UISlider!
    
    
    @IBAction func timeSliderMove(_ sender: Any) {
        playerSong.currentTime = TimeInterval(timeSlider.value)
        playerSong.play()
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimeSlider), userInfo: nil, repeats: true)
    }
    
    
    @IBOutlet weak var timeSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        do {
            
            try playerSong = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            timeSlider.maximumValue = Float(playerSong.duration)

            
            
        } catch {
            
            // Process any errors
            
        }
    }


}

