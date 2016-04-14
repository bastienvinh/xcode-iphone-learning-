//
//  Movie+CoreDataProperties.swift
//  Favourite-Movie
//
//  Created by Cloud Strife on 14/04/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var date_released: NSDate?
    @NSManaged var descriptionMovie: String?
    @NSManaged var image: NSData?
    @NSManaged var name: String?
    @NSManaged var realisator: String?
    @NSManaged var imdbUrl: String?

}
