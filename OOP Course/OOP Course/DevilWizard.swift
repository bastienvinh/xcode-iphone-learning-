//
//  DevilWizard.swift
//  OOP Course
//
//  Created by Cloud Strife on 01/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import Foundation


class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
    
}
