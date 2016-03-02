import Foundation


class Character {
    
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    
    
    // Properties
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        get {
            return hp > 0
        }
    }
    
    
    // Initialisazer
    init(startingHP: Int, attackPwr: Int) {
        _hp = startingHP
        _attackPwr = attackPwr
    }
    
    // Public Action
    func attempAttack(attackPwr: Int) -> Bool {
        _hp -= attackPwr
        
        return true
    }
    
}