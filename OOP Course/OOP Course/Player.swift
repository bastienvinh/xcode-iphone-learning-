//
//  Player.swift
//  OOP Course
//
//  Created by Cloud Strife on 01/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import Foundation

class Player: Character {
    
    // Atributes
    
    private var _name: String = "Player"
    private var _inventory = [String]()
    
    // Properties
    var name: String {
        get {
            return _name
        }
    }
    
    var inventory: [String] {
        get {
            return _inventory
        }
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHP: hp, attackPwr: attackPwr)
        _name = name
    }
    
    
    func addToInventory(obj: String) {
        if obj != "" {
            _inventory.append(obj)
        }
    }
    
}