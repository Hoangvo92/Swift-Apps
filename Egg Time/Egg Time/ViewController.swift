//
//  ViewController.swift
//  Egg Time
//
//  Created by Hoang Vo on 4/25/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let defaultTime = 360 //for reset function, the time could be set randomly
    var clockTimer = 360 //for running the lock
    
    @IBOutlet weak var clock: UILabel!
    
    var timer = Timer() //class timer to create a running clock
    
    @objc func decreaseTimer(){
        
         print("a second has passed!")
         clockTimer -= 1
         if clockTimer < 0 {
              clock.text = "Time Up!! Egg is hatched!"
              timer.invalidate()
          }
         else
         {
              clock.text = "\(clockTimer)"
         }
 }
    @IBAction func pause(_ sender: UIBarButtonItem) {
        //to pause clock, simply do invalidate() on timer
        timer.invalidate()
    }
    
    @IBAction func play(_ sender: UIBarButtonItem) {
        //to play the lock, simply do scheduledTimer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func minus10(_ sender: Any) {
        if (clockTimer - 10) > 0 {
            clockTimer -= 10
            clock.text = "\(clockTimer)"
        }
        else{
            clockTimer = 0
            clock.text = "\(clockTimer)"
        }
    }
    
    @IBAction func reset(_ sender: UIBarButtonItem) {
        clockTimer = defaultTime
        clock.text = "\(clockTimer)"
    }
    
    
    @IBAction func add10(_ sender: Any) {
        clockTimer += 10
        clock.text = "\(clockTimer)"
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clock.text = "\(clockTimer)"

        
    }


}

