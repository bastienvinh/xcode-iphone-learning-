import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var listeRecipeTableView: UITableView!
    var recipies = [Recipe]()
//    var fetchResultsController : NSFetchedResultsController!

    override func viewDidLoad() {
        super.viewDidLoad()
        listeRecipeTableView.delegate = self
        listeRecipeTableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchAndSetResults()
        listeRecipeTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipies.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("RecipeTVCell") as? RecipeTVCell {
            let recipe = recipies[indexPath.row]
            cell.configureCell(recipe) 
            return cell
        }
        
        
        return RecipeTVCell()
    }
    
    
    func fetchAndSetResults() {
        // Get the main delegate
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Recipe")
        
        do {
            
            let results = try context.executeFetchRequest(fetchRequest)
            self.recipies = results as! [Recipe]
        
        } catch  let err as NSError {
            print(err.description)
        }
    }
    

}

