import UIKit

class AddMovieVC: UIViewController,
    UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    private let LIMIT_FOR_PILOT_DESCRIPTION = 10
    private let MIN_DESCRIPTION = 100
    private let MIN_OFFSETY_FOR_COMPLETE : CGFloat = 0
    private let DEFAULT_TEXT = "ADD PHOTO"
    
    
    // Our Components
    
    @IBOutlet weak var imageDescriptionImageView: UIImageView!
    @IBOutlet weak var addImgButton: UIButton!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var pilotTextView: UIShortTextView!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var descriptionTextView : UITextView!
    
    @IBOutlet weak var completeButtonBar: UIBarButtonItem!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var imagePickerController = UIImagePickerController()
    private var imageData : NSData? = nil
    
    
    // Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        pilotTextView.limitCharacter = LIMIT_FOR_PILOT_DESCRIPTION
        imageDescriptionImageView.layer.cornerRadius = 0.5
        imageDescriptionImageView.clipsToBounds = true
        
        // Need to create event animation on scroll
        scrollView.delegate = self
        completeButtonBar.enabled = false
        
        imagePickerController.delegate = self
        
        // TODO : Find a way to scale the image to aspect fill
        // For some reason, Aspect fill not working
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        imageDescriptionImageView.image = image
        imageData = UIImagePNGRepresentation(image)
        showAddButton(false)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // TODO : can do better than this by comparing movies name coordinate and current scroll coordinate
        
        completeButtonBar.enabled = scrollView.contentOffset.y > MIN_OFFSETY_FOR_COMPLETE
    }
    
    @IBAction func addButtonPressed(sender: UIButton) {
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func completeButtonPressed(sender: UIBarButtonItem) {
        
        if let title = titleTextField.text, let pilot = pilotTextView.text, let desc = descriptionTextView.text, let dataImg = imageData
            where title != "" && pilot != "" && desc != "" && desc.characters.count > MIN_DESCRIPTION {
            
            // We fill our list
            let newMovie = MovieService.createMovieEntity()
            newMovie.descriptionMovie = desc
            newMovie.image = dataImg
            newMovie.name = title
            newMovie.imdbUrl = urlTextField.text
            
            // Data save persis our movie
            MovieService.addMovie(newMovie)
        }
        
    }
    
    
    // Utility
    private func showAddButton(response: Bool = true) {
        
        addImgButton.titleLabel?.text = response ? DEFAULT_TEXT : ""
        
    }
}
