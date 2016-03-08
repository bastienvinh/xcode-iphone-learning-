import UIKit

class YellowViewController: UIViewController {
    
    @IBOutlet weak var TestLabel: UILabel!
    var transferText = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TestLabel.text = transferText
    }
    
    
    
}
