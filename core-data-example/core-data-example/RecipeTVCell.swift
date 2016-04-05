import UIKit

class RecipeTVCell: UITableViewCell {
    
    @IBOutlet weak var illustrationImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(recipe: Recipe) {
        title.text = recipe.title
        illustrationImage.image = recipe.getRecipeImage()
    }
    
}
