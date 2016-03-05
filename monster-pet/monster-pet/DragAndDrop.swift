import Foundation
import UIKit


class DragImg: UIImageView {
    
    
    var originalPosition: CGPoint!
    var dropTarget: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder ) {
        super.init(coder: aDecoder)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // We capture at start the center of the image to keep trace of orginal position
        originalPosition = self.center
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first {
            let position = touch.locationInView(self.superview)
            self.center = CGPoint(x: position.x, y: position.y)
        }
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first, let target = dropTarget {
            let position = touch.locationInView(self.superview)
            
            if CGRectContainsPoint(target.frame, position) {
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "onTargetDropped", object: nil))
            }
        }
        
        self.center = originalPosition
    }
    
}