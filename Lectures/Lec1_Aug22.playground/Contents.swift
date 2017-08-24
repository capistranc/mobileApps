//: Playground - noun: a place where people can play
//Skype: alfonso.tapia1@outlook.com
//Email: alfonso.tapia@mobileappscompany.com

import UIKit

var str = "Hello, playground"

class MyClass{
    var number:Int? // ? makes class varaible optional
    var num2:Int! = 0 // Optional but must be intialized, at some point may be nil
    private (set) var word:String
    
    
    init(word:String) {
        self.word = word
    }
    func printName() {
        print(word)
    }
    
//        fileprivate myThirdProperty:float = 0.0 // Public within file, private otherwise
//        open var myFourthProperty:Double = 5.5 //Have access to this var no matter what
//    
//        func changeMyFirstProperty(_ x:Int, _word:String) {
//            myFirstProperty = x;
//            mySecondProperty = word;
//        }
//    
}
var myClass = MyClass.init(word: "Hello")
myClass.number = nil;
let cat = myClass.number;

//print(myClass.number!) //never use ! operator aftter optional variable. Bad Practice
//

func myFunction(){
    if let unwrappedNumber = myClass.number{
        for _ in 0...unwrappedNumber{
            print(myClass.word);
        }
    } else{
        print("no number")
    }
}

func myGuardFunction() {
    guard let cat = myClass.number else {return print("no number")} // if v
    print("passed")
    guard cat > 5 else {return}
    for _ in 0...cat{
        print(myClass.word)
    }
    
}

//myGuardFunction()
myClass.number = 8

//let multipliedNumber = myClass.number * myClass.number //Cannot multipled 2 optional numbers
let product = myClass.number != nil ? myClass.number! * myClass.number! : 0

//nil coalescing
let dog = myClass.number ?? 0
//print(dog)
//Optional Chaining

var myNumber = 10

var optionalClass:MyClass?
optionalClass = MyClass(word: "Sorry, My Fault")
optionalClass?.number = 10
//optionalClass = nil
print(optionalClass?.number?.hashValue)

array1 = ["a", "b", "c", "d"]

let filtered = myArray1.filter($0.characters.first == "o")
