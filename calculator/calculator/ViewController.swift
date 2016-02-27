import UIKit
import AVFoundation // TO add sound functionnality

class ViewController: UIViewController {
    
    
    enum OperationType: String {
        case Divide = "/"
        case Multiply = "x"
        case Add = "+"
        case Subtract = "-"
        case Empty = ""
    }
    

    /************************* Controls Outlets **********************************/
    @IBOutlet weak var resultLabel: UILabel!
    
    /************************* End Controls Outlets ******************************/
    
    
    /************************* Variables *****************************************/
    
    
    private var btnSound: AVAudioPlayer!
    private var runningNumber = ""
    private var leftValString = ""
    private var rightValString = ""
    private var currentOperation: OperationType = OperationType.Empty
    private var result: String = ""
    
    /************************* Ends Variables ************************************/
    
    
    
    /************************* Events UI *****************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMusic()
    }
    
    
    @IBAction func numberPressed(btn : UIButton!) {
        // At each click we play a song
        playSound()
        
        
        runningNumber += "\(btn.tag)"
        resultLabel.text = runningNumber
    }
    
    @IBAction func dividePressed(sender: UIButton) {
        playSound()
        processOperation(OperationType.Divide)
    }
    
    
    @IBAction func multiplyPressed(sender: UIButton) {
        playSound()
        processOperation(OperationType.Multiply)
    }
    
    @IBAction func subtractPressed(sender: UIButton) {
        playSound()
        processOperation(OperationType.Subtract)
    }
    
    @IBAction func addPressed(sender: UIButton) {
        playSound()
        processOperation(OperationType.Add)
    }
    
    @IBAction func equalPressed(sender: UIButton) {
        playSound()
        processOperation(currentOperation)
    }
    
    /************************* END Events UI ************************************/

    
    /************************* Utility Function *********************************/

    
    private func processOperation(op: OperationType) {
        
        if currentOperation == OperationType.Empty {
            leftValString = runningNumber
            runningNumber = ""
            currentOperation = op
            return
        }
        
        if runningNumber != "" {
            
            rightValString = runningNumber
            runningNumber = ""
            
            switch currentOperation {
            case OperationType.Multiply:
                result = "\(Double(leftValString)! * Double(rightValString)!)"
                break
            case OperationType.Divide:
                result = "\(Double(leftValString)! / Double(rightValString)!)"
                break
            case OperationType.Add:
                result = "\(Double(leftValString)! + Double(rightValString)!)"
                break
            case OperationType.Subtract:
                result = "\(Double(leftValString)! - Double(rightValString)!)"
                break
            default:
                break
            }
            
            leftValString = result
            resultLabel.text = result
        }
        
        currentOperation = op
    }
    
    private func playSound() {
        if btnSound.playing {
            btnSound.stop()
        }
        
        btnSound.play()
    }
    
    private func loadMusic() {
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
        }
        catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    
    /************************* END Utility Function *****************************/
    
}

