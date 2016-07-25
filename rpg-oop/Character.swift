//
//  Character.swift
//  rpg-oop
//
//  Created by Kevin Simon on 25.07.16.
//  Copyright © 2016 Kevin Simon. All rights reserved.
//

import Foundation

class Character {
    // Attributes
    private var _hp: Int = 100
    private var _attackPower = 10
    
    var attackPower: Int {
        return _attackPower
    }
    
    var hp: Int {
        get {
            return _hp
        }
        set(healthPoints) {
           self._hp = healthPoints
        }
    }
    
    var isAlive: Bool{
        get {
            if hp <= 0{
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHp: Int, attackPower: Int) {
        self._hp = startingHp
        self._attackPower = attackPower
    }
    
    func attemptAttack (attackPower: Int) -> Bool {
        self._hp -= attackPower
        
        return true
    }
}
