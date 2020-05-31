//
//  ViewController.swift
//  sound shaker starry night starry sea
//
//  Created by Hoang Vo on 5/31/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    let soundArray = [ "music/ost1", "music/ost2", "music/ost3" ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            
            let randomNumber = Int(arc4random_uniform(UInt32(soundArray.count)))
            let fileLocation = Bundle.main.path(forResource: soundArray[randomNumber], ofType: "mp3")
            do {

                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileLocation!))
                player.play()
            } catch {
                
            }
        }
    }

}

