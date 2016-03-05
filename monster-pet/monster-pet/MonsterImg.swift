import Foundation
import UIKit

class  MonsterImg : UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder ) {
        super.init(coder: aDecoder)
    }
    
    // TODO : Make this class more generic
    
    
    func playIdleAnimation() {
        var images = [UIImage]()
        
        for i in 1...4 {
            let img = UIImage(named: "idle\(i).png")
            images.append(img!)
        }
        
        
        self.animationImages = images
        self.animationDuration = 0.8
        self.animationRepeatCount = 0 // 0 means do it infinitely
        self.startAnimating()
    }
    
    func playDeathAnimation() {
        
        self.image = UIImage(named:"dead5.png")
        
        self.animationImages = nil // Just to be sure, can happen to innexpected things without clear collections images
        
        var images = [UIImage]()
        
        for i in 1...5 {
            let img = UIImage(named: "dead\(i).png")
            images.append(img!)
        }
        
        self.animationImages = images
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
        
    }
    
}