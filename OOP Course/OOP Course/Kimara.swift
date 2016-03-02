//
//  Kimara.swift
//  OOP Course
//
//  Created by Cloud Strife on 01/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import Foundation


class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Tough Hide", "Kimara Venom", "Rare Trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attempAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attempAttack(attackPwr)
        }
        
        return false
    }
    
}