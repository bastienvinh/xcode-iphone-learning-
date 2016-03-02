//
//  Enemy.swift
//  OOP Course
//
//  Created by Cloud Strife on 01/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import Foundation

class Enemy : Character {
    
    
    var loot: [String] {
        return ["Rusty Dagger", "Cracker Buckler"]
    }
    
    var type:String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        
        if !isAlive {
            let rand = Int( arc4random_uniform(UInt32( loot.count )))
            return loot[rand]
        }
        
        return nil
    }
    
    
}