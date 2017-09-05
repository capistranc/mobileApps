//: Playground - noun: a place where people can play

import UIKit

enum Action:Int{
    case Move = 1
    case Attack = 3
    case Rest = -5
}

enum ActionError:Error{
    case MaxedOutError(String)
    case FatiguedError(String)
    case HealthyError(String)
}

class User{
    private (set) var energy = 10
    private (set) var attackCount = 0
    private (set) var moveCount = 0
    let actionMax = 5
    let maxEnergy = 15
    
    func rest() {
        self.energy += 5
    }
    
    func attack() {
        self.attackCount += 1
        self.energy -= Action.Attack.rawValue
    }
    func move() {
        self.moveCount += 1
        self.energy -= Action.Move.rawValue
    }
    
    init(energy:Int) {
        self.energy = energy
    }
}



func performAction(user:User, action:Action)throws{
    
    
    guard (user.energy - action.rawValue) >= 0 || action == Action.Rest else {
        throw ActionError.FatiguedError("Not enough energy, you have \(user.energy) energy left")
    }
    
    switch action {
    case .Move:
        guard (user.moveCount < user.actionMax) else {
        throw ActionError.MaxedOutError("You cannot move anymore, you have already performed it \(user.actionMax) times")
        }
        user.move()
    case .Attack:
        guard (user.attackCount < user.actionMax) else {
        throw ActionError.MaxedOutError("You cannot attack anymore, you have already performed it \(user.actionMax) times")
        }
        user.attack()
    default:
        user.rest()
        break
    }
}


//Test Code
let myUser = User(energy: 5)

do {
    try performAction(user: myUser, action: Action.Move)
    try performAction(user: myUser, action: Action.Move)
    try performAction(user: myUser, action: Action.Move)
    try performAction(user: myUser, action: Action.Move)
    try performAction(user: myUser, action: Action.Move)
    try performAction(user: myUser, action: Action.Rest)
    try performAction(user: myUser, action: Action.Move)
    try performAction(user: myUser, action: Action.Attack)
    try performAction(user: myUser, action: Action.Rest)
    try performAction(user: myUser, action: Action.Attack)
    try performAction(user: myUser, action: Action.Move)
    try performAction(user: myUser, action: Action.Attack)
} catch ActionError.FatiguedError(let error){
    print(error)
} catch ActionError.MaxedOutError(let error){
    print(error)
}