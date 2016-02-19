import UIKit

class ViewController: UIViewController {
    
    // Our control conponents
    
    @IBOutlet weak var logoImageView : UIImageView!
    @IBOutlet weak var NumberTapEnterTxt : UITextField!
    @IBOutlet weak var PlayButton : UIButton!
    
    @IBOutlet weak var TapButton : UIButton!
    @IBOutlet weak var TapLabel : UILabel!
    
    private var countTap : UInt = 0
    private var scoreToAttin : UInt = 0
    
    
    // Messages
    private let FORMAT_MESSAGE_TAPS : String = "%u Taps"
    
    
    
    @IBAction func OnPlayButtonPressed(sender : UIButton!) {
        
        if ( NumberTapEnterTxt.text != nil && NumberTapEnterTxt.text != "" ) {
            
            scoreToAttin = UInt( NumberTapEnterTxt.text! )!
        
            HideElementsFirstPage(true)
            HideElementsSecondPage(false)
        
            // Reset text  everytime
            // We set elements to 0 and reset message
            ResetParty()
        }
    }
    
    @IBAction func OnTapButtonsPressed( sender: UIButton! ) {
        countTap += 1
        UpdateTapLevel()
        
        
        if IsGameOver() {
            // We restart the game
            RestartGame()
        }
    }
    
    
    func RestartGame() {
        HideElementsFirstPage(false)
        HideElementsSecondPage(true)
        
        NumberTapEnterTxt.text = ""
    }
    
    func ResetParty() {
        countTap = 0;
        UpdateTapLevel()
    }
    
    
    func IsGameOver() -> Bool {
        return countTap >= scoreToAttin
    }
    
    
    // UI utility function
    
    
    
    func UpdateTapLevel() {
        TapLabel.text = String( format: FORMAT_MESSAGE_TAPS, countTap )
    }
    
    func HideElementsFirstPage(isDisable : Bool) {
        
        logoImageView.hidden = isDisable
        NumberTapEnterTxt.hidden = isDisable
        PlayButton.hidden = isDisable
        
    }
    
    func HideElementsSecondPage(isDisable : Bool) {
        
        TapLabel.hidden = isDisable
        TapButton .hidden = isDisable
    }
}

