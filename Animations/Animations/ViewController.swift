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
    @IBAction func nextButton(_ sender: UIButton) {
        guzman.image = UIImage(named: "r\(counter1).gif")
        sakura.image = UIImage(named: "\(counter2).gif")
        counter1 += 1
        counter2 += 1
        if counter1 == 9 {
            counter1 = 0
        }
        
        if counter2 == 6 {
            counter2 = 0
        }
    }
    
    
    @IBOutlet weak var guzman: UIImageView!
    
    @IBOutlet weak var sakura: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

