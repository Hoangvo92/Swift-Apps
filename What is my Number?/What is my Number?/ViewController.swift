//
//  ViewController.swift
//  What is my Number?
//
//  Created by Hoang Vo on 4/25/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var numberField: UITextField!
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        UserDefaults.standard.set(numberField.text, forKey: "number")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let numberObject = UserDefaults.standard.object(forKey:"number")
        if let number = numberObject as? String {
            numberField.text = number
        }
    }


}

