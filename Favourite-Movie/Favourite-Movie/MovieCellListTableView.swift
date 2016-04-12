import UIKit

class MovieCellListTableViewCell: UITableViewCell {
    
    // TODO : just for test for now -> must finnish this part
    @IBOutlet weak var labelTitle: UILabel!
    
    
    func configureCell(movie: Movie) {
        labelTitle.text = movie.name
    }
    
}
