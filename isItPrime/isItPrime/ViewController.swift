//
//  ViewController.swift
//  isItPrime
//
//  Created by Hoang Vo on 4/24/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterValue: UITextField!
    
    @IBOutlet weak var output: UILabel!
    
    
    @IBOutlet weak var buttonPrime: UIButton!
    
    
    @IBAction func buttonPrime(_ sender: UIButton) {
        
        var isPrime = true
        
        if let numberString = enterValue.text {
            if let number = Int(numberString){
                if number == 1 {
                    isPrime = false
                }
                var countNumber = 2
                while countNumber < number {
                    if number % countNumber == 0 {
                        isPrime = false
                    }
                    countNumber += 1
                }
                
                if isPrime == true {
                    output.text = "\(number) is a Prime!"
                }
                else{
                    output.text = "\(number) is not a Prime!"
                }
            } else{
                output.text = "Please enter numerical values, not letters"
            }
            
        } else
        {
            output.text = "Please enter a positive whole number"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

