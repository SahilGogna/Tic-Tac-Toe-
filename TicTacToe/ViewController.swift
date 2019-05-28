//
//  ViewController.swift
//  TicTacToe
//
//  Created by Sahil Gogna on 2019-05-22.
//  Copyright © 2019 Sahil Gogna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // cross
    var gameState = [ 0,0,0,0,0,0,0,0,0]
    var combinations = [[0,1,2], [3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var isActive = true
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var resultLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playAgain(_ sender: Any) {
        gameState = [ 0,0,0,0,0,0,0,0,0]
        isActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        resultLable.isHidden = true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        
    }
    
    @IBAction func action(_ sender: UIButton) {
        if gameState[sender.tag-1] == 0 && isActive == true {
            gameState[sender.tag-1] = 1
            if activePlayer == 1  {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControl.State())
                activePlayer = 2
            } else{
                sender.setImage(UIImage(named: "Nought.png"), for: UIControl.State())
                activePlayer = 1
            }
        }
        
        for combination in combinations{
            // if the box all the combinations for the win are filled
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                
                isActive = false
                if gameState[combination[0]] == 1 {
                    resultLable.text = "CROSS HAS WON!"
                } else{
                    resultLable.text = "NOUGHT HAS WON!"
                }
                
                playAgainButton.isHidden = false
                resultLable.isHidden = false
            }
        }
    }
}

