//
//  Movie.swift
//  Favourite-Movie
//
//  Created by Cloud Strife on 14/04/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movie: NSManagedObject {
    
    
    // TODO : Improve this case or not
    
    func getImageDescriptionMovie() -> UIImage {
        return UIImage(data: self.image!)!
    }

}
