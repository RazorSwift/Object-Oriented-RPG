//
//  DevilWizard.swift
//  rpg-oop
//
//  Created by Kevin Simon on 25.07.16.
//  Copyright © 2016 Kevin Simon. All rights reserved.
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
