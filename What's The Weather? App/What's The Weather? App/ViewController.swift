//
//  ViewController.swift
//  What's The Weather? App
//
//  Created by Hoang Vo on 4/28/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var cityTextField: UITextField!
    
    
    @IBAction func submitButton(_ sender: UIButton) {
        if let url = URL(string: "http://www.weather-forecast.com/locations/" + cityTextField.text!.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest") {
         
         let request = NSMutableURLRequest(url: url)
         
         let task = URLSession.shared.dataTask(with: request as URLRequest) {
             data, response, error in
             
             var message = ""
             
             if error != nil {
                 
                 print(error!)
                 
             } else {
                 
                 if let unwrappedData = data {
                     
                    
                     
                     let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                     
                     
                     var stringSeparator = "Weather Today</h2> (1–3 days):</div><p class=\"location-summary__text\"><span class=\"phrase\">\">"
                     
                     if let contentArray = dataString?.components(separatedBy: stringSeparator) {
                         
                         if contentArray.count > 1 {
                             
                             stringSeparator = "</span>"
                             
                             let newContentArray = contentArray[0].components(separatedBy: stringSeparator)
                             
                             if newContentArray.count > 1 {
                                 
                                 message = newContentArray[0].replacingOccurrences(of: "&deg;", with: "°")
                                 
                                 print(message)
                                 
                             }
                             
                             
                         }
                         
                     }
                     
                 }
                 
                 
             }
             
             if message == "" {
                 
                 message = "The weather there couldn't be found. Please try again."
                 
             }
             
             DispatchQueue.main.sync(execute: {
                 
                 self.outputInfor.text = message
                 
             })
             
         }
         
         task.resume()
             
         } else {
             
             outputInfor.text = "The weather there couldn't be found. Please try again."
             
         }
         
    }
    
    
    @IBOutlet weak var outputInfor: UILabel!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       /* let url = URL(string: "http://www.weather-forecast.com/locations/London/forecasts/latest")!
        let request = NSMutableURLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            var message = ""
            if let error = error {
                print (error)
            }
            else {
                if let unwrappedData = data {
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    var stringSeparator = "Weather Today</h2> (1–3 days):</div><p class=\"location-summary__text\"><span class=\"phrase\">\">"
                    if let contentArray = dataString?.components(separatedBy: stringSeparator){
                        if contentArray.count > 0{
                           // print(contentArray[0])
                              stringSeparator = "</span>"
                              let newContentArray = contentArray[0].components(separatedBy: stringSeparator)
                              if newContentArray.count > 0 {
                                message = newContentArray[0].replacingOccurrences(of: "&deg", with: "*")
                                print(newContentArray[0])
                                    
                                }
                              
                            
                        }
                    }
                }
            }
            if message == ""{
                message = "The weather couldn't be found. Please try again"
                
            }
            print(message)
            DispatchQueue.main.sync(execute: {
                self.outputInfor.text = message
            }
            )
            
        }
        task.resume()
  */
    }



}

