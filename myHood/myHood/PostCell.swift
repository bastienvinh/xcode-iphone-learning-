import UIKit

class PostCell: UITableViewCell {
    
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(image: UIImage, title: String, description: String) {
        postImg.image = image
        titleLbl.text = title
        descriptionLbl.text = description
    }
    
    // BV : Bad practice because it is not generic or use protocols
    func configureCell(post: Post) {
        let image = UIImage(named: post.imagePath)
        configureCell(image!, title: post.title, description: post.description)
    }
    
}
