//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str.characters.map{String($0)}.joined(separator: "-"))

//class Cache {
//    static var shared = Cache()
//}
//
//extension Collection {
//    func shuffle() -> Collection {
//        var list = Array(self)
//        list.shuffleInPlace()
//        return list
//    }
//
//    mutating func shuffleInPlace() {
//        let shuffled = self.map{$0 = arc4random_uniform(0,self.count)}
//        return shuffled
//    }
//}

//var cards = [1,2,3,4,5,6,7,8,9,10]
//How to handle branching patterns
//if doing daily scrum - all team may work on one branch
//if doing weekly scrum - most likely using multiple branches.
//MRR - manual retain release
//
//
//
