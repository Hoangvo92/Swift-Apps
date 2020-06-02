# Swift-Apps
This repository contains projects from IOS 12 Swift course in Udemy
Use Xcode 10 & Swift 4 to make real iOS12 apps like Uber and Instagram, with CoreML & ARKit. Includes AWS Service

###First App:
  -just a demo app using label, button, textfield in Swift
  
##Cat Year App - App1:
  -The user enters a number and press a button, and the app will show the real age of the cat in cat years.
  -apply : UIViewController, UITextFieldDelegate
  -good pickup: trying to assign textfield to get only numerical input
          +link:https://www.tutorialspoint.com/how-to-restrict-uitextfield-to-take-only-numbers-in-swift
         
             <
             import UIKit
             class ViewController: UIViewController, UITextFieldDelegate {
                @IBOutlet weak var tf: UITextField!
                override func viewDidLoad() {
                   tf.delegate = self
                   super.viewDidLoad()
                }
                func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
                   if let x = string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) {
                      return true
                   } else {
                      return false
                   }
               }
             }
             
             >

###GuessingGame App:
-The user enters a number from 0 to 10 as numbers of fingers. Then user presses a button
 -The app will enegerate a random number and check whether the user guessed right
 
 ###Is It Prime App:
 -The user enters a random number. Then user presses a button
 -The app will check whether the number is prime


###Control the Keyboard:
-make keyboard disappear by tabbing:
            
            override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
               self.view.endEditing(true)
        
              }

###TableViews:
-Using two framework to manage tableview: UITableViewDataSource, UITableViewDelegate

-basic syntax:
          
          func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return 50
          }
       
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CELL")
              //cell.textLabel?.text = "\(indexPath.row + 1)"
              return cell
          }



##Tic Tac Toes -App2:
-a simple game app to play tic tac toes
-apply some simple algorithms for the game
-apply viewDidLoad() for animation effect and hide announce:
            
                override func viewDidLoad() {
                super.viewDidLoad()
                // Do any additional setup after loading the view.
                announcement.isHidden = true
                playAgainButton.isHidden = true
                announcement.center = CGPoint(x: announcement.center.x - 500, y: announcement.center.y)
                playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
            }
-apply button action:
 
                @IBAction func playAgain(_ sender: Any) {
                       
                       announcement.isHidden = true
                       playAgainButton.isHidden = true
                       announcement.center = CGPoint(x: announcement.center.x - 500, y: announcement.center.y)
                       playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
                       count = 0
                       isX = false// to choose between x and 0
                       winnerChoose = false
                       xOro = 0 //1 for x, 2 for 0
                       result = [0,0,0,0,0,0,0,0,0]
                       //set all button image to empty
                       var button: UIButton
                       for i in 1..<10 {
                           if let button = view.viewWithTag(i) as? UIButton{
                               button.setImage(nil, for: [])
                           }

                       }
                       
                   }
-there is another solution with name tictactoe 


##Animation2 -App3:
-Learn a great deal about animation effect by using loop, timer and array of images
                                 
                            var timer = Timer()
                            counter1 = 1
                             
                             @objc func animate(){
                                 
                                guzman.image = UIImage(named: "r\(counter1).gif")
                                  
                                counter1 += 1
                           
                                if counter1 == 11 {
                                  counter1 = 0
                                        }
                                 
                             }
                             
                               @IBAction func nextButton(_ sender: UIButton) {
                                      if isAnimating == false {
                                          timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
                                          isAnimating = true
                                          button.setTitle( "Stop Animating", for: [])
                                      }
                                      else
                                      {
                                          timer.invalidate()
                                          isAnimating = false
                                          button.setTitle( "Start Animating", for: [])
                                      }
                                     
                                  }
                                  
-apply animation effect like slide in, grow, and fade in



                   @IBAction func fadeIn(_ sender: Any) {
                       guzman.alpha = 0
                       UIView.animate(withDuration: 1, animations: {
                           self.guzman.alpha = 1
                       })
                   
                   }
                   
                   @IBAction func slideIn(_ sender: Any) {
                       guzman.center = CGPoint(x: guzman.center.x - 500, y: guzman.center.y)
                       
                       UIView.animate(withDuration: 1, animations: {
                           self.guzman.center = CGPoint(x: self.guzman.center.x + 500, y: self.guzman.center.y)
                       })
                   }
                   
                   
                   @IBAction func grow(_ sender: Any) {
                       guzman.frame = CGRect(x: 0, y: 60, width: 0, height: 0)
                   
                       UIView.animate(withDuration: 1, animations: {
                           self.guzman.frame = CGRect(x: 0, y: 60, width: 414, height: 220)
                       })
                   }

 
 ##Memorable Places Main App- App4:
 -an app that shows table view with list of locations: user can add in their new locations as memory
 -The app uses MAP KIT VIEW to allow user to use longpress to add location
 
                  override func viewDidLoad() {
                      super.viewDidLoad()
                      // Do any additional setup after loading the view.
                      let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
                      uilpgr.minimumPressDuration = 2
                      map.addGestureRecognizer(uilpgr)
                      ...................
                      
                      @objc func longpress(gestureRecognizer: UIGestureRecognizer){
                          if gestureRecognizer.state == UIGestureRecognizer.State.began{
                              print("longpress")
                              let touchPoint = gestureRecognizer.location(in: self.map)
                              let new_coordinate = self.map.convert(touchPoint, toCoordinateFrom: self.map)
                              //convert from CLLocationCoordinate2D to CLLocation for geocode
                              let location = CLLocation(latitude: new_coordinate.latitude, longitude: new_coordinate.longitude)
                              var title = ""
                              CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                                  if error != nil {
                                      print(error!)
                                  } else {
                                      if let placemark = placemarks?[0]{
                                          if placemark.subThoroughfare != nil {
                                              title += placemark.subThoroughfare! + " "
                                          }
                                          
                                          if placemark.thoroughfare != nil {
                                              title += placemark.thoroughfare!
                                          }
                                      }
                                  }
                                  if title == "" {
                                      title = "Added \(NSDate())"
                                  }
                                  let annotation = MKPointAnnotation()
                                  annotation.coordinate = new_coordinate
                                  annotation.title = title
                                  self.map.addAnnotation(annotation)
                                  globalPlaces.append(["name": title, "lat": "\(new_coordinate.latitude)", "lon": "\(new_coordinate.longitude)"])
                                  UserDefaults.standard.set(globalPlaces, forKey: "places")
                              }
                              )

                          }

                      }
 -apply Userdefaults to store memory
 
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

 -apply segue to connect views +  transfer data between views via segue
 -apply delete feature of tableview
           

                import UIKit
                import MapKit
                import CoreLocation

                class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
                
                var manager = CLLocationManager()
                ............................
                manager.delegate = self
                manager.desiredAccuracy = kCLLocationAccuracyBest
                manager.requestWhenInUseAuthorization()
                manager.startUpdatingLocation()
                ......................................
                
                     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
                         if editingStyle == UITableViewCell.EditingStyle.delete {
                             globalPlaces.remove(at: indexPath.row)
                             UserDefaults.standard.set(globalPlaces, forKey: "places")
                             
                             table_view_outlet.reloadData()
                         }
                     }
-apply location manager (corelocation) to know location of user:
                     
                     
                     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                         let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
                         
                         let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                         
                         let region = MKCoordinateRegion(center: location, span: span)
                         
                         self.map.setRegion(region, animated: true)
                     }

-to set a mapview on phone screen:
                     
                     let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                     
                     let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                     
                     let region = MKCoordinateRegion(center: coordinates, span: span)
                     
                     self.map.setRegion(region, animated: true)
                     
                     let annotation = MKPointAnnotation()
                     annotation.coordinate = coordinates
                     annotation.title = name
                     self.map.addAnnotation(annotation)


###Location Aware from finding location
-applying features of finding location
-applying coreLocation and Geocoder(Mapkit)
            
            
            func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
               
                 let user_location: CLLocation = locations[0]
                // let latitude = user_location.coordinate.latitude
                 latitude_label.text = String(user_location.coordinate.latitude)
                 //let longitude = user_location.coordinate.longitude
                 longitude_label.text = String(user_location.coordinate.longitude)
                 course_label.text = String(user_location.course)
                 speed_label.text = String(user_location.speed)
                 altitude_label.text = String(user_location.altitude)
             
                 CLGeocoder().reverseGeocodeLocation(user_location) { (placemarks, error) in
                     if error != nil {
                         print(error!)
                         
                     }
                     else {
                         if let placemark = placemarks?[0]{
                             print(placemark)
                             var sub_throughfare = ""
                             if placemark.subThoroughfare != nil {
                                 sub_throughfare = placemark.subThoroughfare!
                             }
                             
                             var throughfare = ""
                             if placemark.thoroughfare != nil {
                                 throughfare = placemark.thoroughfare!
                             }
                             
                             var sublocality = ""
                             if placemark.subLocality != nil {
                                 sublocality = placemark.subLocality!
                             }
                             
                             var postal_code = ""
                             if placemark.postalCode != nil {
                                 postal_code = placemark.postalCode!
                             }
                             
                             var country = ""
                             if placemark.country != nil {
                                 country = placemark.country!
                             }
                             self.Address_label.text = sub_throughfare + ", " + throughfare
                             self.postalCode_label.text = postal_code
                             self.country_label.text = country
                             self.state_label.text = sublocality
                             
                         }
                     }
                 }
             }
