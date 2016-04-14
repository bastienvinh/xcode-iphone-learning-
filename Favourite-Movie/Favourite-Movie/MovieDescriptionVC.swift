import UIKit

class MovieDescriptionVC: UIViewController {

    
    private var _selectedMovie: Movie?
    
    func setMovieSelected(movie: Movie) {
        _selectedMovie = movie
    }
    
    
    /// Override func events
    override func viewDidLoad() {
         super.viewDidLoad()
        
        print("Hello world !!")
        print("Current Movie Name : \(_selectedMovie?.name)")
    }
    
    
    
}
