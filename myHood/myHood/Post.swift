import Foundation


class Post: NSObject, NSCoding {
    
    private let KEY_IMAGE_PATH = "imagePath"
    private let KEY_TITLE = "title"
    private let KEY_DESCRIPTION = "description"
    
    private var _imagePath: String!
    private var _title: String!
    private var _postDescription: String!
    
    init( imagePath: String, title: String, description: String ) {
        _imagePath = imagePath
        _title = title
        _postDescription = description
    }
    
    override init() {
        
    }
    
    required convenience  init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey(KEY_IMAGE_PATH) as? String
        self._title = aDecoder.decodeObjectForKey(KEY_TITLE) as? String
        self._postDescription = aDecoder.decodeObjectForKey(KEY_DESCRIPTION) as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imagePath, forKey: KEY_IMAGE_PATH)
        aCoder.encodeObject(self._title, forKey: KEY_TITLE)
        aCoder.encodeObject(self._postDescription, forKey: KEY_DESCRIPTION)
    }
    
    var imagePath: String {
        get {
            return _imagePath
        }
    }
    
    var title: String {
        get {
            return _title
        }
    }
    
    var postDescription: String {
        get {
            return _postDescription
        }
    }
    
}