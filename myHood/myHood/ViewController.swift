import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let NUMBER_OF_SECTION = 1
    
    var posts = [Post]()

    @IBOutlet weak var tableViewComments: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewComments.delegate = self
        tableViewComments.dataSource = self
        
        
        // False data for now
        let post1 = Post(imagePath: "barrel-water-bridge", title: "Hello Kitty", description: "Description 1 of the death, of the desert. You realise that your product is working great")
        let post2 = Post(imagePath: "barrel-water-bridge", title: "Manadou Oulala", description: "Description 2 is working greater than your possesion and depossession for greate good lalala")
        let post3 = Post(imagePath: "barrel-water-bridge", title: "Goudja", description: "Tell other that you can add new features to your projects and start working very hard for me ...")
        
        posts.append(post1)
        posts.append(post2)
        posts.append(post3)
        
        tableViewComments.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return NUMBER_OF_SECTION
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        var newCell: PostCell!
        
        // TODO : manage default datas / use data for user to understand that he can't load this data
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            
            // TODO : capture error image didn't exists / Manage default image
            cell.configureCell(post)
            newCell = cell
        }
        else {
            newCell = PostCell()
            newCell.configureCell(post)
        }
        
        return newCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 87.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count // we return the total number of our rows
    }

}

