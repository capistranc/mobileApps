//: Playground - noun: a place where people can play
// BlackJack application
// Player is dealt two cards initially.
// Player hits until their hand value is above 17 or they bust

import UIKit

enum Card:Int{
    case Ace = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
    
    static func drawCard() -> Card{
        let cardId = Int(arc4random_uniform(UInt32(13))) + 1
        return Card(rawValue: cardId)!
    }
}


var cardValue:[Card:Int] = [.Ace: 1, .Two: 2, .Three: 3, .Four: 4, .Five: 5, .Six: 6, .Seven: 7, .Eight: 8, .Nine: 9,
                            .Ten: 10, .Jack: 10, .Queen: 10, .King: 10]

func getHandValue(hand:[Card]) -> Int{
    let aceLowValue = hand.flatMap{cardValue[$0]}.reduce(0){ $0 + $1 }
    let aceHighValue = hand.flatMap{$0 == .Ace ? 11 : cardValue[$0]}.reduce(0){ $0 + $1 }
    return aceHighValue > 21 ? aceLowValue : aceHighValue
}

class BlackJackHand{
    private (set) var handValue: Int
    private (set) var hand:[Card] = []
    
    init() {
        hand.append(Card.drawCard())
        hand.append(Card.drawCard())
        handValue = getHandValue(hand: hand)
    }
    
    func hit() {
        hand.append(Card.drawCard())
        handValue = getHandValue(hand: hand)
    }
    
    func getCurrentHandValue()->Int{
        return handValue
    }
    
    func printHand() {
        let formattedString = hand.map{String(describing: $0)}.joined(separator: ", ")
        print("Current hand is: " + formattedString)
    }
    
    func stringifyHand()->String{
        let formattedString = hand.map{String(describing: $0)}.joined(separator: ", ")
        return formattedString
    }
    
    
}

enum BlackJackError:Error{
    case BustedError(String)
    case DealerRuleError(String)
}

func playBlackJack(hand:BlackJackHand) throws {
    let handVal = hand.getCurrentHandValue()
    
    guard handVal < 17  else {
        throw BlackJackError.DealerRuleError("Hand Value: \(handVal). You're the dealer, you cannot hit after 17")
    }
    
    hand.hit()
    let newVal = hand.getCurrentHandValue()
    print("You hit! You're new hand is: " + hand.stringifyHand())
    
    guard newVal < 21 else {
        throw BlackJackError.BustedError("Hand Value: \(newVal). Bust!!")
    }
    
    newVal == 21 ? print("21! Congratulations you win!") : print("Your hand value is now \(newVal)")
}

let myHand = BlackJackHand()
do {
    myHand.printHand()
    try playBlackJack(hand: myHand)
    try playBlackJack(hand: myHand)
    try playBlackJack(hand: myHand)
} catch BlackJackError.BustedError(let error) {
    print(error)
} catch BlackJackError.DealerRuleError(let error){
    print(error)
}
