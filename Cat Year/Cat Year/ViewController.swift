//
//  ViewController.swift
//  Cat Year
//
//  Created by Hoang Vo on 4/22/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
 //add in UITextFieldDelegate to manipulate the values
    @IBOutlet weak var getCatAge: UIButton!
    
    @IBOutlet weak var answer: UITextField!
    
    @IBOutlet weak var catAge: UILabel!
    var number = 0
    @IBAction func getCatAge(_ sender: UIButton) {
        if let n = answer.text{
 
            number =  Int(n)! * 7
            catAge.text = "Your cat is " + String(number) + " in cat years!"
       
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        answer.delegate = self //for textfield to get only numerical values
    }
    
    //to limit textfield to get only numerical values
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       if let x = string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) {
          return true
       } else {
       return false
    }
    }

}

//link for resource in text field
//https://www.tutorialspoint.com/how-to-restrict-uitextfield-to-take-only-numbers-in-swift
