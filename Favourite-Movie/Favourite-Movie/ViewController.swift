import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var listMovieTableView: UITableView!
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        listMovieTableView.delegate = self
        listMovieTableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchData()
        
        listMovieTableView.reloadData()
        listMovieTableView.tableHeaderView = nil
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCellListTableViewCell") as? MovieCellListTableViewCell {
            let theMovieOfTheCell = movies[indexPath.row]
            
            cell.configureCell(theMovieOfTheCell)
            return cell
        }
        
        return MovieCellListTableViewCell()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 // Always 1 section
    }
    
    private func fetchData() {
        movies = MovieService.loadMovies()
    }


}

