//
//  Kimara.swift
//  rpg-oop
//
//  Created by Kevin Simon on 25.07.16.
//  Copyright © 2016 Kevin Simon. All rights reserved.
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
    override func attemptAttack(attackPower: Int) -> Bool {
        if attackPower >= IMMUNE_MAX{
            return super.attemptAttack(attackPower: attackPower)
        } else {
            return false
        }
    }
}
