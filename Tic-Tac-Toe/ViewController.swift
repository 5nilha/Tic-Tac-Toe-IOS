//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Fabio Quintanilha on 12/31/16.
//  Copyright © 2016 Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1 // Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6 ,7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
  
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var message: UILabel!
    
    
    
    @IBAction func action(_ sender: AnyObject) {
        
        if (gameState[sender.tag - 1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag - 1] = activePlayer
            
            if (activePlayer == 1){
                (sender as AnyObject).setImage(UIImage(named: "quinn.png"), for: UIControlState())
                activePlayer = 2
                
            } else { // active player == 2
                (sender as AnyObject).setImage(UIImage(named: "Batman.png"), for: UIControlState())
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
            
                gameIsActive = false
            
                if gameState[combination[0]] == 1
                {
                    //cross has won
                    print("CROSS")
                    label.text = "🏆🏆 HARLEY QUINN WIN!"
                    message.text = "Hi Puddin, Miss me?"
                }
                else {
                    //nought has won
                    print("Nought")
                    label.text = "🏆🏆 BATMAN WIN!"
                     message.text = "I'm the Vegeance. I'm the Night. I am Batman!"
                }
                
                
                playAgain.isHidden = false
                label.isHidden = false
                message.isHidden = false
            
            }
            
        }

        gameIsActive = false
        
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
                
            }
        }
        
        if gameIsActive == false {
            
            label.text = "GAME DRAWN!"
            message.text = "hahahahahaha. Try Again Batman!"
            label.isHidden = false
            message.isHidden = false
            playAgain.isHidden = false
        }
        
    }
    
    
    @IBOutlet weak var playAgain: UIButton!
    
 
    @IBAction func playagainTapped(_ sender: Any) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgain.isHidden = true
        label.isHidden = true
        message.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }

        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

