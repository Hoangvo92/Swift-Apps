//
//  ViewController.swift
//  my first app
//
//  Created by Hoang Vo on 4/1/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

//this is a comment
import UIKit

class ViewController: UIViewController {

    
    @IBAction func logIn(_ sender: Any) {
        if let name = email.text {
        if name != "SakuraAvalon@Queen.com" {
            print("Hello! Sore Loser Touya!")
            motto.text = "Sore Loser! Know your Pitiful Level! " + name
        }
        else{
            if let passW = password.text {
                if passW != "DanceSexySteven" {
                    print("Touya is still a sore loser!")
                    motto.text = "Cry! Sore Loser !"
                }
                else{
                    print("Winner!")
                    motto.text = defaultMotto
                }
            }

        }
        }
    }
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var motto: UILabel!
    var defaultMotto = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hoang Vo")
        defaultMotto = motto.text!
    }


}

