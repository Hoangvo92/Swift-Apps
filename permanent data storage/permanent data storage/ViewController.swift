//
//  ViewController.swift
//  permanent data storage
//
//  Created by Hoang Vo on 4/25/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // UserDefaults.standard.set("hoang", forKey:"name")
        let objectname = UserDefaults.standard.object(forKey: "name")
        if let name = objectname as? String {
             print(name)
        }
        //save array
        let array = [3,4,5,6,7]
        UserDefaults.standard.set(array, forKey: "arr")
        let arrayObject = UserDefaults.standard.object(forKey:"arr")
        if let arr1 = arrayObject as? NSArray {
            print(arr1)
        }
       
    }



}

