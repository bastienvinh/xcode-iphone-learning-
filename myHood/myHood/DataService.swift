import Foundation
import UIKit

class DataService {
    
    private static let INDEX_POSTS = "posts_index_data"

    private static var _loadedPosts = [Post]()
    
    private init() {}
    
    // Properties
    
    static var loadedPosts : [Post] {
        get {
            return _loadedPosts
        }
    }
    
    // Utilities
    
    class func savePosts() {
        let postData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        NSUserDefaults.standardUserDefaults().setObject(postData, forKey: INDEX_POSTS)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    class func loadPosts() {
        if let postData = NSUserDefaults.standardUserDefaults().objectForKey(INDEX_POSTS) as? NSData {
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postData) {
                _loadedPosts = (postsArray as? [Post])!
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: NotificationEvKey.PostsLoaded.rawValue, object: nil))
    }
    
    // Save image and create image on disk
    class func saveImageAndCreatePath(image: UIImage) -> String {
        // TODO : can't be right, because a phone can store as many photos, always remember that
        
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentPathForFilename(imgPath)
        
        // write on disk image
        imgData?.writeToFile(fullPath, atomically: true)
        
        return imgPath
    }
    
    
    // Give back image from which we store un our application
    class func imageForPath(path: String) -> UIImage? {
        let fullPath = documentPathForFilename(path)
        let image = UIImage(named: fullPath)
        
        return image
    }
    
    // Return the path root of all documents for this application
    class func documentPathForFilename(name: String) -> String {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = path[0] as NSString
        
        return fullPath.stringByAppendingString(name)
    }
    
    class func addPost(post: Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
}

