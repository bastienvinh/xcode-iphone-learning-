import UIKit

class AddMovieVC: UIViewController, UIScrollViewDelegate {
    
    private let LIMIT_FOR_PILOT_DESCRIPTION = 10
    private let MIN_OFFSETY_FOR_COMPLETE : CGFloat = 0
    
    
    // Our Components
    
    @IBOutlet weak var imageDescriptionImageView: UIImageView!
    @IBOutlet weak var addDescriptionButton: UIButton!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var pilotTextView: UIShortTextView!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var descriptionTextView : UITextView!
    
    @IBOutlet weak var completeButtonBar: UIBarButtonItem!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    // Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        pilotTextView.limitCharacter = LIMIT_FOR_PILOT_DESCRIPTION
        
        // Need to create event animation on scroll
        scrollView.delegate = self
        completeButtonBar.enabled = false
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // TODO : can do better than this by comparing movies name coordinate and current scroll coordinate
        
        completeButtonBar.enabled = scrollView.contentOffset.y > MIN_OFFSETY_FOR_COMPLETE
    }
    
    @IBAction func completeButtonPressed(sender: UIBarButtonItem) {
        
        // TODO : continue
        
    }
}
