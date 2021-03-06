//
//  Player.swift
//  rpg-oop
//
//  Created by Kevin Simon on 25.07.16.
//  Copyright © 2016 Kevin Simon. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    
    var name: String {
        get{
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        return _inventory
    }
    
    func addItemToInventory(item: String){
        _inventory.append(item)
    }
    
    convenience init (name: String, hp: Int, attackPower: Int){
        self.init(startingHp: hp, attackPower: attackPower)
        self._name = name
    }
}
