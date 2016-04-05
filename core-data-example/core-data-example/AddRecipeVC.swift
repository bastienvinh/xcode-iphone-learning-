import UIKit
import CoreData

class AddRecipeVC: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngredients: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var addImageBtn: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        
        recipeImg.layer.cornerRadius = 4.0
        recipeImg.clipsToBounds = true
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        recipeImg.image = image
    }
    
    @IBAction func onAddImagePressed(sender: UIButton!) {
         presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onCreateRecipePressed(sender: UIButton!) {
        
        
        if let title = recipeTitle.text where title != "" {
            
            // Retrieve components from Core Data
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            
            let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
            
            
            // Set information for our new recipe
            recipe.title = recipeTitle.text
            recipe.ingredients = recipeIngredients.text
            recipe.steps = recipeSteps.text
            recipe.setRecipeImage(recipeImg.image!)
            
            
            context.insertObject(recipe)
            
            // We save the data
            do {
                try context.save()
            } catch let err as NSError {
                print(err.description)
            }
            
            // We ask our navigation controller to go back
            self.navigationController?.popViewControllerAnimated(true)
        }
        
    }
    
}
