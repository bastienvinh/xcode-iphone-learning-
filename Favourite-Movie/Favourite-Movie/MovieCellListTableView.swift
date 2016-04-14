import UIKit

class MovieCellListTableViewCell: UITableViewCell {
    
    // TODO : just for test for now -> must finnish this part
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    
    
    func configureCell(movie: Movie) {
        labelTitle.text = movie.name
        imageMovie.image = movie.getImageDescriptionMovie()
    }
    
}
