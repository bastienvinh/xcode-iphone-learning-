import Foundation
import CoreData
import UIKit

class MovieService {
    
    static let ENTITY_NAME: String = "Movie"
    static weak var _context: NSManagedObjectContext!
    
    class func loadMovies() -> [Movie] {
        
        let context = createContext()
        let fetchRequest = NSFetchRequest(entityName: MovieService.ENTITY_NAME)
        
        
        var result : [Movie];
        
        do  {
            let results = try context.executeFetchRequest(fetchRequest)
                result = results as! [Movie]
            
        } catch let err as NSError {
            result = [Movie]()
            print("Problem retriving movies in Core Data : \(err.description)")
        }
        
        return result
    }
    
    private class func createContext() -> NSManagedObjectContext {
        
        if _context == nil {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            _context = app.managedObjectContext
        }
        
        return _context
    }
    
    class func createMovieEntity() -> Movie {
        let context = createContext()
        let entity = NSEntityDescription.entityForName(MovieService.ENTITY_NAME, inManagedObjectContext: context)!
        
        return Movie(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    
    class func addMovie(movie: Movie) {
        let context = createContext()
        
        context.insertObject(movie)
        do { try context.save() } catch let err as NSError {
            // TODO : Improve error manager
            print(err.description)
        }
    }
    
    // TODO : create a more decent builder function
    // Class func createMovieEntity(  )
    
    class func removeMovie(movie: Movie) {
        // TODO : Must implement it
    }
    
    class func removeMovie(id: Int) {
        // TODO : Must implement it
    }
    
    private init() {
        
    }
}