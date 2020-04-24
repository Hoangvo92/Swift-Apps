# Swift-Apps
This repository contains projects from IOS 12 Swift course in Udemy
Use Xcode 10 & Swift 4 to make real iOS12 apps like Uber and Instagram, with CoreML & ARKit. Includes AWS Service

First App:
  -just a demo app using label, button, textfield in Swift
  
Cat Year App:
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

GuessingGame App:
-The user enters a number from 0 to 10 as numbers of fingers. Then user presses a button
 -The app will enegerate a random number and check whether the user guessed right
 
 Is It Prime App:
 -The user enters a random number. Then user presses a button
 -The app will check whether the number is prime

