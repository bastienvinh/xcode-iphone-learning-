import UIKit

class MovieListTableView: UITableView {
    
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        initParameter()
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
       super.init(frame: frame, style: style)
        initParameter()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    private func initParameter() {
        self.backgroundColor = UIColor.brownColor()
        self.sectionHeaderHeight = 0
        self.sectionFooterHeight = 0
        self.contentInset = UIEdgeInsetsZero
        
    }
    
}
