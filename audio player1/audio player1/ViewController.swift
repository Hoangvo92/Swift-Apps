//
//  ViewController.swift
//  audio player1
//
//  Created by Hoang Vo on 5/30/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBAction func play(_ sender: Any) {
        playerSound.play()
    }
    
    @IBAction func Pause(_ sender: Any) {
        playerSound.pause()
    }
    
    @IBAction func slider_moved(_ sender: Any) {
        playerSound.volume = slider.value
    }
    
    @IBOutlet weak var slider: UISlider!
    
    
    
    
    var playerSound = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let audioPath = Bundle.main.path(forResource: "04 - CRESCENDO (Instrumental)", ofType: "mp3")
        
        do {
            try playerSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
           // playerSound.play()
        } catch {
            //process any error
        }
    }


}

