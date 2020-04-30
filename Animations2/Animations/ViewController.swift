//
//  ViewController.swift
//  Animations
//
//  Created by Hoang Vo on 4/29/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter1 = 1
    var counter2 = 1
    var isAnimating = false
    
    var timer = Timer()
    
    @IBOutlet weak var button: UIButton!
    
    
    
    @objc func animate(){
        
        guzman.image = UIImage(named: "r\(counter1).gif")
               sakura.image = UIImage(named: "\(counter2).gif")
               counter1 += 1
               counter2 += 1
               if counter1 == 11 {
                   counter1 = 0
               }
               
               if counter2 == 7 {
                   counter2 = 0
               }
        
    }
    @IBAction func nextButton(_ sender: UIButton) {
        if isAnimating == false {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            isAnimating = true
            button.setTitle( "Stop Animating", for: [])
        }
        else
        {
            timer.invalidate()
            isAnimating = false
            button.setTitle( "Start Animating", for: [])
        }
       
    }
    
    
    @IBOutlet weak var guzman: UIImageView!
    
    @IBOutlet weak var sakura: UIImageView!
    
    
    @IBAction func fadeIn(_ sender: Any) {
        guzman.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.guzman.alpha = 1
        })
    
    }
    
    @IBAction func slideIn(_ sender: Any) {
        guzman.center = CGPoint(x: guzman.center.x - 500, y: guzman.center.y)
        
        UIView.animate(withDuration: 1, animations: {
            self.guzman.center = CGPoint(x: self.guzman.center.x + 500, y: self.guzman.center.y)
        })
    }
    
    
    @IBAction func grow(_ sender: Any) {
        guzman.frame = CGRect(x: 0, y: 60, width: 0, height: 0)
    
        UIView.animate(withDuration: 1, animations: {
            self.guzman.frame = CGRect(x: 0, y: 60, width: 414, height: 220)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

