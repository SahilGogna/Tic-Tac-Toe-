
import UIKit

class ViewController: UIViewController {
    
    var activePlayer = true // cross
    var square = [1,2,3,4,5,6,7,8,9]
    var gameState = [ 0,0,0,0,0,0,0,0,0]
    var isActive = true
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var resultLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playAgain(_ sender: Any) {
        gameState = [ 0,0,0,0,0,0,0,0,0]
        square = [1,2,3,4,5,6,7,8,9]
        isActive = true
        activePlayer = true
        
        playAgainButton.isHidden = true
        resultLable.isHidden = true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        
    }
    
    @IBAction func action(_ sender: UIButton) {
        
        if gameState[sender.tag-1] == 0 && isActive == true {
            // mark the box filled
            gameState[sender.tag-1] = 1
            
            if activePlayer == true  {
                square[sender.tag-1] = 11
                sender.setImage(UIImage(named: "Cross.png"), for: UIControl.State())
            } else{
                sender.setImage(UIImage(named: "Nought.png"), for: UIControl.State())
                square[sender.tag-1] = 22
            }
            let victory = checkVictory()
            
            // a player wins game
            if victory == 1{
                if activePlayer == true {
                    resultLable.text = "CROSS HAS WON!"
                } else {
                    resultLable.text = "NOUGHT HAS WON!"
                }
                isActive = false
                playAgainButton.isHidden = false
                resultLable.isHidden = false
            } else if victory == 0{
                resultLable.text = "Draw"
                isActive = false
            } else {
                activePlayer = !activePlayer
            }
            
        }
    }
    
    /*********************************************
     FUNCTION TO RETURN GAME STATUS
     1 FOR GAME IS OVER WITH RESULT
     -1 FOR GAME IS IN PROGRESS
     O GAME IS OVER AND NO RESULT
     **********************************************/
    func checkVictory() -> Int {
        if square[0] == square[1] && square[1] == square[2]{
            return 1
        }
        else if square[3] == square[4] && square[4] == square[5]{
           return 1
        }
        else if square[6] == square[7] && square[7]  == square[8]{
            return 1
        }
        else if square[0] == square[3] && square[3]  == square[6]{
            return 1
        }
        else if square[1] == square[4] && square[4]  == square[7]{
            return 1
        }
        else if square[2] == square[5] && square[5]  == square[8]{
           return 1
        }
        else if square[0] == square[4] && square[4]  == square[8]{
            return 1
        }
        else if square[2] == square[4] && square[4]  == square[6]{
            return 1
        }
        else if square[0] != 1 && square[1] != 2 && square[2] != 3 && square[3] != 4 &&
            square[4] != 5 && square[5] != 6 && square[6] != 7 && square[7] != 8 &&
            square[8] != 9{
            return 0
        }
        else {
            return -1
        }
    }
}

