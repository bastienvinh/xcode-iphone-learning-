import UIKit

class UIShortTextView: UITextView, UITextViewDelegate {
    
    ////////// Attributes
    private static let DEFAULT_TEXT_LIMIT : Int = 0
    private var _limitCharacter: Int = DEFAULT_TEXT_LIMIT
    private var _placeHolder: String = ""
    
    ////////// Properties
    
    var limitCharacter: Int {
        get {
            return _limitCharacter
        }
        set {
            _limitCharacter = newValue
        }
    }
    

    // TODO : Create a placeholder for UIShortComponents
    
//    var placeHolderText : String {
//        get {
//            return _placeHolder
//        }
//        set {
//            _placeHolder = newValue
//        }
//    }
    
    
    // Override Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initForUIShortTextView()
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        initForUIShortTextView()
    }
    
    private func initForUIShortTextView() {
        self.delegate = self
    }
    
    // Delegate component
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        var canChange = true
        
        // New rules : We try to implement the limit of characters to the components
        canChange = _limitCharacter > 0 && (self.text.characters.count <= _limitCharacter || (range.length > 0 && text == "") )
        
        return canChange
    }
}
