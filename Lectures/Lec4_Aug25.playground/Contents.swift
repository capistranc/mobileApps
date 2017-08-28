//: Playground - noun: a place where people can play

import UIKit

//Convert array of nums to binary, return array of numbers ordered by number of "1's" in their binary form
//[1, 2, 3, 4, 5, 6, 7, 8, 9, 10] -> [1, 10, 11, 100, 101, 110, 111, 1000, 1001, 1010]
//-> [7, 3, 5, 6, 9, 10, 1, 2, 4, 8]

let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

func reorderByBinary(nums:[Int]) -> [Int]{
    let set = Set(nums.map{$0})
    
    var hash = [Int:Int]()
    let binaryNums = set.flatMap{String($0, radix: 2) }
    
    binaryNums.map{
        let oneCount = $0.characters.reduce(0){ String($1) == "1" ? $0 + 1 : $0}
        if let key = Int($0, radix: 2) {
            hash.updateValue(oneCount, forKey: key)
        }
    }
    
    let sortedArray = nums.sorted {
        let val1 = hash[$0] ?? 0, val2 = hash[$1] ?? 0
        return val1 > val2
    }
    
    print(sortedArray)
    return sortedArray
}
//reorderByBinary(nums: nums)

func reorderByBinary2(nums:[Int]) -> [Int]{
    //Remove duplicates
    let set = Set(nums.map{$0})
    //Convert to binary and count number of 1s in binary
    let binaryArray = set.map{String($0, radix: 2)}.map{$0.components(separatedBy: "1").count - 1}
    //combine them
    let combined = zip(binaryArray, set) //Creates a sequence of pairs built out of two underlying sequences. A tupple
    let sortedZip = combined.sorted{
        ($0.0 == $1.0) ? $0.1 < $1.1 : $0.0 > $1.0 //$ .0 refers to binary number, .1 refers to decimal number
    }
    print(sortedZip.map{$0.1})
    return sortedZip.map{$0.1}
}
//reorderByBinary2(nums: nums)

//Cleanest Version
func reorderByBinary3(numbers:[Int]) -> [Int]{
    let set = Set(numbers.map{$0})
    let binaryArray = set.map{String($0,radix:2)}.map{$0.components(separatedBy: "1").count - 1}
    return zip(binaryArray, set).sorted{
        ($0.0 == $1.0) ? $0.1 < $1.1 : $0.0 > $1.0
        }.map{$0.1}
}

// renamed for clarity. Learn how to use $0.0, $1.0, etc. to reference tuples
func reorderByBinaryRenamed(numbers:[Int]) -> [Int]{
    let set = Set(numbers.map{$0})
    let binaryArray = set.map{String($0,radix:2)}.map{$0.components(separatedBy: "1").count - 1}
    let renamedValues:[(binary: Int, decimal: Int)] = zip(binaryArray, set).map{($0, $1)}
    return renamedValues.sorted{($0.binary == $1.binary) ? $0.decimal < $1.decimal : $0.binary > $1.binary}
        .map{$0.decimal}
}



enum Numbers:Int{
    case One = 1, Two, Three, Four
}

//var myServerObject:Number?
//
//func whatAmI(number:Number){
//
//}
//if myServerObject = .One {
//
//}


let myColor = UIColor.green
let mySecondColor = UIColor(colorLiteralRed: 234.2, green: 128.1, blue: 123.0, alpha: 1)

//Enum Example 1
enum NetworkError:Error {
    case BadUrl(String)
    case UrlDoesNotExist
    
}
func connectToTheServer() throws {
    let connection = false
    guard connection else {
        throw NetworkError.BadUrl("Url badly written")
    }
    
    print("Hello")
}

do {
    try connectToTheServer()
} catch NetworkError.BadUrl(let error) {
    print(error)
}

//Enum Ex 2
enum Toppings:String{
    case Pepperoni = "Pepperoni"
}

let myTopping = Toppings.Pepperoni

//Enum Ex 3
enum SlotError:Error{
    case NotEnoughCredit(String)
    case OutOfOrder(String)
}
class User{
    var card: String
    var credit:Int
    
    init(card:String, credit:Int) {
        self.card = card
        self.credit = credit
    }
}
let myUser = User(card: "1234567890", credit: 20)


func playMachine(user:User)throws{
    guard user.credit > 0 else {
        throw SlotError.NotEnoughCredit("Not enough credit: Your remaining credit is \(user.credit)")
    }
    user.credit -= 5
}


do {
    try playMachine(user: myUser)
    print("Played once \(myUser.credit)")
    try playMachine(user: myUser)
    print("Played twice \(myUser.credit)")
    try playMachine(user: myUser)
    print("Played thrice \(myUser.credit)")
    try playMachine(user: myUser)
    print("Played four times \(myUser.credit)")
    try playMachine(user: myUser)
    print("Played fifth time \(myUser.credit)")
    
} catch SlotError.NotEnoughCredit(let error){
    print(error)
}

//Homework:
//Create three examples of your own utilizing enum types and try catch blocks
//Ex: cars, can only drive if you have a flat
//If you have a flat, you cannot drive
//You can have upto 4 flats
//You can fix or get a flat

