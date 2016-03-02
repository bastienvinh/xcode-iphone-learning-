//
//  ViewController.swift
//  OOP Course
//
//  Created by Cloud Strife on 01/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // Components
    
    @IBOutlet weak var actionLabels: UILabel!
    @IBOutlet weak var playerHpLabel: UILabel!
    @IBOutlet weak var enemyHpLabel: UILabel!
    
    @IBOutlet weak var enemy1Image: UIImageView!
    @IBOutlet weak var enemy2Image: UIImageView!
    
    @IBOutlet weak var chestButton: UIButton!
    
    
    // Variables
    private var _player: Player!
    private var _enemy: Enemy!
    private var _chestMessage : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _player = Player(name: "", hp: 200, attackPwr: 20)
        generateEnemy()
        
        playerHpLabel.text = "\(_player.hp) HP"
    }

    @IBAction func onChestTapped(sender: UIButton) {
        chestButton.hidden = true
        actionLabels.text = _chestMessage
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateEnemy), userInfo: nil, repeats: false)
        
        
    }
    
    @IBAction func onAttackTapped(sender: AnyObject) {
        
        if (_enemy.attempAttack(_player.attackPwr)) {
            actionLabels.text = "Attacked \(_enemy.hp) for \(_player.attackPwr)"
            enemyHpLabel.text = "\(_enemy.hp) HP"
        }
        else {
            actionLabels.text = "Attack was unsuccessful!"
        }
        
        if let loot = _enemy.dropLoot() {
            _player.addToInventory(loot)
            _chestMessage = "\(_player.name) found \(loot)"
            chestButton.hidden = false
        }
        
        if !_enemy.isAlive {
            enemyHpLabel.text = ""
            actionLabels.text = "Killed \(_enemy.type)"
            enemy1Image.hidden = true
        }
        
    }
    
    func generateEnemy() {
        let rand = Int( arc4random_uniform(2) )
        
        if rand == 0 {
            _enemy = Kimara(startingHP: 50, attackPwr: 10)
        }
        else {
            _enemy = DevilWizard(startingHP: 60, attackPwr: 15)
        }
        
        enemy1Image.hidden = false
    }

}

