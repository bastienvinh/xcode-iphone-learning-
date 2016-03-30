import UIKit

class PostCell: UITableViewCell {
    
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
    }
    
    func configureCell(image: UIImage, title: String, description: String) {
        postImg.image = image
        titleLbl.text = title
        descriptionLbl.text = description
    }
    
    // BV : Bad practice because it is not generic or use protocols
    func configureCell(post: Post) {
        let image = DataService.imageForPath(post.imagePath)
        configureCell(image!, title: post.title, description: post.postDescription)
    }
    
}
