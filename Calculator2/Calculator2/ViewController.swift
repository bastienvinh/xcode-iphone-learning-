import UIKit

class ViewController: UIViewController {

    enum OperationType {
        case Add
        case Divide
        case Subtract
        case Multiply
        case None
    }
    
    @IBOutlet weak var _resultLabel: UILabel!
    
    private var leftNumber: String = ""
    private var rightNumber: String = ""
    private var currentOperation: OperationType = OperationType.None
    private var operationAlreadyPressed: Bool = false
    
    @IBAction func onNumberPressed(sender: UIButton) {
        playMusic()
        // TODO : add music effect
        rightNumber += String(sender.tag)
        
        refreshScreen()
    }
    
    @IBAction func onClearButtonPressed(sender: UIButton) {
        playMusic()
        resetEverything()
        refreshScreen()
    }
    
    @IBAction func onAddButtonPressed(sender: UIButton) {
        playMusic()
        processOperation(OperationType.Add)
    }
    
    @IBAction func onDivideButtonPressed(sender: UIButton) {
        playMusic()
        processOperation(OperationType.Divide)
    }
    
    @IBAction func onMultiplyButtonPressed(sender: UIButton) {
        playMusic()
        processOperation(OperationType.Multiply)
    }
    
    @IBAction func onSubtractButtonPressed(sender: UIButton) {
        playMusic()
        processOperation(OperationType.Subtract)
    }
    
    @IBAction func onEqualButtonPressed(sender: UIButton) {
        playMusic()
        processOperation(OperationType.None)
    }
    
    private func resetEverything() {
        rightNumber = "0"
        currentOperation = OperationType.None
        leftNumber = ""
    }
    
    private func refreshScreen() {
        
        if (rightNumber != "") {
            _resultLabel.text = rightNumber
        }
        
    }
    
    private func loadMusicPlayer() {
        // TODO : Play the music
    }
    
    private func playMusic() {
        // TODO : Play this music
    }
    
    private func processOperation(op : OperationType) {
        // TODO : manage multiple sign at the same time
        
        if currentOperation == OperationType.None && leftNumber == "" {
            leftNumber = rightNumber
            rightNumber = ""
            currentOperation = op
            operationAlreadyPressed = true
            return
        }
        
        if rightNumber != "" {
            
            switch currentOperation {
            case OperationType.Add:
                rightNumber = "\(Double(leftNumber)! + Double(rightNumber)! )"
                break
            case OperationType.Multiply:
                rightNumber = "\(Double(leftNumber)! * Double(rightNumber)! )"
                break
            case OperationType.Subtract:
                rightNumber = "\(Double(leftNumber)! - Double(rightNumber)! )"
                break
            case OperationType.Divide:
                rightNumber = "\(Double(leftNumber)! / Double(rightNumber)! )"
                break
            default:
                break;
            }
            
            refreshScreen()
            
            leftNumber = rightNumber
            rightNumber = ""
            operationAlreadyPressed = false
        }
        
        currentOperation = op
    }
    
    
}

