//
//  ViewController.swift
//  Time Table App
//
//  Created by Hoang Vo on 4/25/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var slider: UISlider!
    
    @IBAction func sliderChanged(_ sender: Any) {
        print(slider.value)
        table.reloadData()
    }
    
    
    @IBOutlet weak var table: UITableView!
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

     
     // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
     // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
     
   
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:  UITableViewCell.CellStyle.default, reuseIdentifier: "CELL")
        
        cell.textLabel?.text = "\(Int((slider.value * 20))*(indexPath.row + 1))"
        return cell
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

