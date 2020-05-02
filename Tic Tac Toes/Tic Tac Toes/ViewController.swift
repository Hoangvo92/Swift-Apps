//
//  ViewController.swift
//  Tic Tac Toes
//
//  Created by Hoang Vo on 5/1/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    var isX = false// to choose between x and 0
    var winnerChoose = false
    var xOro = 0 //1 for x, 2 for 0
    var result = [0,0,0,0,0,0,0,0,0]//0: empty, 1: cross x, 2: nought 0
    
    @IBOutlet weak var announcement: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        count += 1
        if result[sender.tag - 1] == 0 {
            
            //Assign value on button
            if isX == false{
                //assign button o
                 sender.setImage( UIImage(named:"nought.png"), for: UIControl.State.normal)
            
                 result[sender.tag - 1] = 2
                 isX = true
            
             }
             else
             {
                 //assign button x
                 sender.setImage( UIImage(named:"cross.png"), for: UIControl.State.normal)
                 result[sender.tag - 1] = 1
                 isX = false
              }
            //check result
            checkResult()
            if winnerChoose {
                announcement.isHidden = false
                playAgainButton.isHidden = false
                 if xOro == 1 {
                    print("X won!")
                    announcement.text = "CROSS HAS WON!"
                 }
                 else
                {
                    print("O won!")
                    announcement.text = "NOUGHT HAS WON!"
                }
                UIView.animate(withDuration: 1, animations: {
                    self.announcement.center = CGPoint(x: self.announcement.center.x + 500, y: self.announcement.center.y)
                    self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    
                })
               
               
            }
        }
        if (count == 9 && winnerChoose == false) {
            announcement.isHidden = false
            playAgainButton.isHidden = false
              announcement.text = "IT IS A TIE!"
            
            UIView.animate(withDuration: 1, animations: {
                self.announcement.center = CGPoint(x: self.announcement.center.x + 500, y: self.announcement.center.y)
                self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                
            })
        }
    }
    
    
    func checkResult()
    {//function to check result of tic tac toe game
        if (result[0] == result[3] && result[3] == result[6] && result[0] != 0) {
            winnerChoose = true
            xOro = result[0]
        }
        if (result[0] == result[1] && result[1] == result[2] && result[0] != 0) {
            winnerChoose = true
            xOro = result[0]
        }
        if (result[0]==result[4] && result[4]==result[8] &&
            result[0] != 0) {
            winnerChoose = true
            xOro = result[0]
        }
        if (result[1]==result[4] && result[4]==result[7] &&
            result[1] != 0) {
            winnerChoose = true
            xOro = result[1]
        }
        if (result[2]==result[5] && result[5]==result[8] &&
            result[2] != 0) {
            winnerChoose = true
            xOro = result[2]
        }
        if (result[2]==result[4] && result[4]==result[6] &&
            result[2] != 0) {
            winnerChoose = true
            xOro = result[2]
        }
        if (result[3]==result[4] && result[4]==result[5] &&
            result[3] != 0) {
            winnerChoose = true
            xOro = result[3]
        }
        if (result[6]==result[7] && result[7]==result[8] &&
            result[6] != 0) {
            winnerChoose = true
            xOro = result[6]
        }
    }
    
    
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        announcement.isHidden = true
        playAgainButton.isHidden = true
        announcement.center = CGPoint(x: announcement.center.x - 500, y: announcement.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }


}

