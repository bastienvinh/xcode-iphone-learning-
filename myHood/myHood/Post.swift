import Foundation


class Post {
    
    private var _imagePath: String!
    private var _title: String!
    private var _postDescription: String!
    
    init( imagePath: String, title: String, description: String ) {
        _imagePath = imagePath
        _title = title
        _postDescription = description
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
    
    var description: String {
        get {
            return _postDescription
        }
    }
    
}