//
//  Recipe.swift
//  core-data-example
//
//  Created by Cloud Strife on 01/04/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Recipe: NSManagedObject {
    
    
    
    func setRecipeImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getRecipeImage() -> UIImage {
        let img = UIImage(data: self.image!)
        return img!
    }

}
