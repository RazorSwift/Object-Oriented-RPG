//
//  ViewController.swift
//  rpg-oop
//
//  Created by Kevin Simon on 25.07.16.
//  Copyright © 2016 Kevin Simon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var enemyLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var chestButton: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var lootMessage: String?
    
    @IBAction func onChestTapped(_ sender: AnyObject) {
        chestButton.isHidden = true
        outputLabel.text = lootMessage
        
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(generateRandomEnemy), userInfo: nil, repeats: false)
    }
    
    @IBAction func onAttackPressed(_ sender: AnyObject) {
        if enemy.attemptAttack(attackPower: player.attackPower) {
            outputLabel.text = "Attacked \(enemy.type) for \(player.attackPower) HP"
            enemyLabel.text = "\(enemy.hp) HP"
        } else {
            outputLabel.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(item: loot)
            lootMessage = "\(player.name) found \(loot)"
            chestButton.isHidden = false
        }
        
        if !enemy.isAlive {
            enemyImg.isHidden = true
            enemyLabel.text = ""
            outputLabel.text = "Killed \(enemy.type)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "Schaafschuetze", hp: 110, attackPower: 20)
        
        generateRandomEnemy()
        
        playerLabel.text = "\(player.hp) HP"
        enemyLabel.text = "\(enemy.hp) HP"
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPower: 12)
        } else {
            enemy = DevilWizard(startingHp: 60, attackPower: 15)
        }
        
        enemyLabel.text = "\(enemy.hp)"
        enemyImg.isHidden = false
        outputLabel.text = "FIGHT!"
    }
}

