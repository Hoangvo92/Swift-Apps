//
//  SecondViewController.swift
//  To Do List
//
//  Created by Hoang Vo on 4/27/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var enterItem: UITextField!
    
    @IBAction func addButton(_ sender: UIButton) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var items: [String]
        if let tempItems = itemsObject as? [String] {
            items = tempItems
            items.append(enterItem.text!)
        } else
        {
            items = [enterItem.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        enterItem.text = ""
    }
    
    
    
    //to get rid of keyboard by touching
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

