import UIKit

class FirstPageViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadblue(sender: AnyObject!) {
        performSegueWithIdentifier("goToYellow", sender: "TEST SUCCEED TO YELLOW PAL")
    }
    
    @IBAction func loadRed(sender: AnyObject!) {
        performSegueWithIdentifier("goToRed", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        // REMARkK :  One way to do it
        
        
//        if segue.identifier == "goToYellow" {
//            if let yellowVC = segue.destinationViewController as? YellowViewController {
//                yellowVC.transferText = "TEST SUCCEED TO YELLOW PAL"
//            }
//        }
        
        if segue.identifier == "goToYellow" {
            if let yellowVC = segue.destinationViewController as? YellowViewController {
                if let theString = sender as? String {
                    yellowVC.transferText = theString
                }
            }
        }
        
        
    }

}
 