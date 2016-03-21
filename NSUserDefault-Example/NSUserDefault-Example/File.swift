//
//  File.swift
//  NSUserDefault-Example
//
//  Created by Cloud Strife on 20/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding {
    
    var firstName: String!
    var lastName: String!
    
    init(first: String, last: String) {
        firstName = first
        lastName = last
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        
        lastName = aDecoder.decodeObjectForKey("lastName") as? String
        firstName = aDecoder.decodeObjectForKey("firstName") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(lastName, forKey: "lastName")
        aCoder.encodeObject(firstName, forKey: "firstName")
    }
    
}