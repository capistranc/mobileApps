//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

for (i, char) in str.characters.enumerated(){
    //    print(i, char)
}

extension Int{
    mutating func doThePlusThing() {
        self += 1
    }
}

var i:Any = 0

//func guardExample() {
//    guard let i = i as? String else {return print("not an int")}
//    print("It is an interger")
//}


//Switch statement example
var j:Any = "Hello"
func switchExample() { //each case breaks after each case automatically
    switch j {
    case is Int:
        print("thats an int")
    case let s as String where s == "String":
        print("this is my string \(s)")
    case let s as String where s == "Hello":
        print("sup dood")
    fallthrough //use fallthrough if you want to checked for other cases
    case is String:
        print("is a string that says \(j)")
    default:
        print("default canary")

    }
}

//switchExample()

//CCard example
let card:[Int] = [3,7,6,4,7,6,5,3,3]
func cardSwitch() {
    switch card[0] {
    case 3 where card[1] == 7:
        print("it's an amex bruh")
    case 5 where card[1] == 6:
        print("MC time")
    case 4:
        print("visa V dood")
    case 6:
        print("Discover it urself dud")
    default:
        print("iono")
    }
}
//cardSwitch()

//Arrow function examples
let card2:[Int] = [3,7,6,4,7,6,5,3,3]
func thisReturnsAnInt() -> Any{
    return 15
}
//let myInt1 = thisReturnsAnInt()

//Alias and underscore in paramters example.
func multiply(_ first:Int, times second:Int) -> Int{
    return first * second
}

let myInt = multiply(5, times: 2)
//print(myInt)

//class Example:NSObject {
//    var number:Int
//    var word:String
//    init(by number:Int, andWord:String) {
//        self.number = number
//        self.word = andWord
//    }
//}


//func multiply2(_ numberOne:Int,by numberTwo:Int){
//    return numberOne * numberTwo
//}
//
//print(multiply2( 15, by: 43))
class Example2:Equatable{
    var number:Int = 0

    func changeNumber(to otherNumber:Int){
        self.number = otherNumber
    }

    static func == (lhs:Example2, rhs:Example2) -> Bool{ //static:= class function that doesn't need to be init
        return lhs.number == rhs.number
    }
}

//var example = Example2()
//example.changeNumber(to: 5)
////print(example.number)
//
//var ex1 = Example2()
//var ex2 = Example2()
//
//if ex1 == ex2 {
//    print("Success")
//} else {
//    print("not equal")
//}

struct Employee{ //Passed by value on assignment, === never returns true // Doens't need to be initalized
    var number:Int
    var name:String?
    var lastName:String?

    init(number:Int, name:String? = nil, lastName:String? = nil){
        self.number = number
        self.name = name
        self.lastName = lastName
    }
}

let example = Employee(number: 3, name: "Blahblah")

let myNum2 = 5;
var myNum3 = myNum2

myNum3 += 10
//print(myNum2)
//print(myNum3)

//Interface are Protocols in Swift
protocol NumberRules{
    func addNumber()
    func removeNumber()
}
protocol StringRules{
    func addString()
    func removeString()
}

struct NumberString:NumberRules,StringRules{
    func addNumber() {
    }

    func removeNumber() {
    }

    func addString() {
    }

    func removeString() {
    }
}

struct Words:StringRules{
    func addString() {

    }
    func removeString() {

    }
}

let onlyStrings = Words()
let numbersAndStrings = NumberString()

func iReceiveNumbers(myStruct:NumberRules & StringRules) {
    myStruct.removeNumber()
}

iReceiveNumbers(myStruct:numbersAndStrings)

/////////Part 2 Parameters
// use ... operator for arrays, i.e. parameter: String...
func aLotOfParameters(parameters:Any...){ //size and type of parameter declared at runtime
    for param in parameters{
        print(param)
    }
}

protocol number{
    func numberFunction()
}

//aLotOfParameters()
//aLotOfParameters(parameters: 2, Float(3.14159), Character("$"), "Pickle", "Rick") // Do not necessarily need to send in an array

struct ApplesString{
    var characters: [Character]
}

let myString = "Hello"
myString.characters

//HW assignment #1 - Create function that takes variable number of paramters and sums them
//If Int add it
//If String add 5
//Else subtract 10
//sumAny("Hello",2,6,2.0,"10") -> 8
//Bonus: Write it as a single return statement

//
let myInt01 = 10
var myInt02 = 10

let textField = UITextField()
textField.text = "hello"


//Solution to subscripting in Stringsß
extension String{
    subscript (i: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: CountableClosedRange<Int>) -> String {
        get {
            let startIndex =  self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
            return self[startIndex...endIndex]
        }
    }
    
    func charAt(_ index:Int?) -> String? {
        var result : String?
        if let i = index {
            result =  self[i]
        }
        return result
    }
}

let str2 = "hello World"
let char:Character = str2[6]
print(char)
print(str2[0...8])

//dictionary is iOS verion of a hashmap, insert a Define a (key,value) pair
var dictionary:[String:Any] = [:]
var myTupple:(number:Int,word:String) = (5,"hello")



//print(dictionary.removeValue(forKey: "Hello"))

func iReceiveTupple(tupple:(email:String, password:String)){
//    tupple.email
//    tupple.password
}
