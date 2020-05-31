//
//  PlacesViewController.swift
//  Memorable Places Main
//
//  Created by Hoang Vo on 5/30/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit

var globalPlaces = [Dictionary<String, String>()]
var activePlace = -1
class PlacesViewController: UITableViewController {
    
    //there is a need of the outlet to refresh table
    @IBOutlet var table_view_outlet: UITableView!
    
    var activePlace2 = -1
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        

    }
    override func viewDidAppear(_ animated: Bool) {
        
        //using UserDefaults to store memory
        if let tempPlaces = UserDefaults.standard.object(forKey: "places") as? [Dictionary<String, String>]{
            globalPlaces = tempPlaces
        }
        
        if globalPlaces.count == 1 && globalPlaces[0].count == 0 {
            globalPlaces.remove(at: 0)
            globalPlaces.append(["name": "Taj Mahal", "lat": "27.175277", "lon" : "78.042128"])
            
            UserDefaults.standard.set(globalPlaces, forKey: "places")
        }
        activePlace = -1
        activePlace2 = -1
        //to refresh data of the table
        table_view_outlet.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return globalPlaces.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        if globalPlaces[indexPath.row]["name"] != nil {
             cell.textLabel?.text = globalPlaces[indexPath.row]["name"]
        }
       
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activePlace = indexPath.row
        activePlace2 = indexPath.row
        performSegue(withIdentifier: "toMap", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMap" {
            let map_view_controller = segue.destination as! ViewController
            
            map_view_controller.activePlace2 = activePlace2
        }
    }
    
    //to erase or delete data in globalPlaces
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
  
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            globalPlaces.remove(at: indexPath.row)
            UserDefaults.standard.set(globalPlaces, forKey: "places")
            
            table_view_outlet.reloadData()
        }
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
