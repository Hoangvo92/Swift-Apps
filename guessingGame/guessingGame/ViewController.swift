//
//  ViewController.swift
//  guessingGame
//
//  Created by Hoang Vo on 4/24/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var guessNumber: UITextField!
    
    @IBOutlet weak var output: UILabel!
    
    @IBAction func guessButton(_ sender: UIButton) {
        let correctNumber = Int.random(in: 1 ... 5)
        
        if let stringVar = guessNumber.text{
            if let numberVar = Int(stringVar){
                if numberVar == correctNumber {
                    output.text = "Your guess is right. The answer is \(correctNumber)"
                } else {
                    output.text = "Wrong! The correct number is \(correctNumber)"
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

//let number = Int.random(in: 0 ..< 10)
//let number = Int.random(in: 0 ... 10)
//let stayOrGo = Bool.random()
//let names = ["Ford", "Zaphod", "Trillian", "Arthur", "Marvin"]

//let randomName = names.randomElement()
//https://learnappmaking.com/random-numbers-swift/
