//: Playground - noun: a place where people can play

import UIKit

func highestEvenCharCount(words: Any...)->String{
    var wordArray:[String] = []
    wordArray = words.map{
        switch $0 {
        case let str as String:
            return str
        case let strArray as [String]:
            return strArray.joined(separator: " ")
        default:
            return ""
        }}.reduce(""){$0 + $1}.components(separatedBy: " ")
    
    print(wordArray)
    
    let maxOptional = wordArray.map{ $0.characters.count }.filter{$0 % 2 == 0}.max()
    guard let max = maxOptional else {return "There are no even count words"}
    return wordArray.first{ $0.characters.count == max}!
}

let str1 = ["For", "a", "great", "time", "do", "some", "code"]
let str2 = "I love coding on swift"
print(highestEvenCharCount(words: str1))
print(highestEvenCharCount(words: str2))

//Write recursive function that produces an output via print(), the numbers from from, to to. Assume from is less than to.
func countFrom(from:Int, to: Int) {
    print(from)
    if from == to {return}
    countFrom(from: from + 1, to: to)
}
countFrom(from: 5, to: 10)

/*
 1. An optional is a wrapper that contains a value that either have a value, or are equal to nil
 It's helpful for when we have values that may or may not exist when the program runs. This way our program doesn't crash when
 we attempt to use that value
 
 2.The most important part of functional programming is the immutable state of every variable. Essentially every varaible is actually a
 constant. In order to mutate a variable our functions create an entirely new copy of the data before returning it. This allows our functions to be pure, so the function works the same regardless of the input. I.e. Same input always producest the same output.
 
 3.The map function is a functor, I.E. it mutates the input in a 1-1 fashion.
 Essentially map takes a collecton/array of objects, and a closure function, then applies that closure function to each object in the collection/array
 
 4. The filter function is also a functor, that maps 1 - 1. However it takes a boolean closure function and removes all the entries of the array that do not fit
 
 5. Swift is a combination of functional programming and OOP. The existance of structures and classes are stolen from OOP, while the use of the map functions and other functors are taken from functional programming
 
 6. A closure is an anonymous function that can be declared at any time. In swift, every function is actually a closure, some functions are just named closure. It's useful for functions such as map that take a collection and apply a function to that collection. Closures allow us to easily send callback functions to other functions, such as map, filter, etc. so that they can apply that callback function on the collection.
 
 7. A Protocol is the same as an interface in other languages. It defines a template which variables utilizing that protocol are expected to have. It's mostly for documentating our code so it is easy to understand
 
 8. An enumeration is a set of values that a type can contain. Swift's use of enumeration is different in the sense that almost every variable and struct in Swift is an enumeration. The biggest example is optionals, they are enumerated types that either contain a value, or are equal to nil.
 
 9. A Struct is an object that is passed by value, while a Class is passed around by reference. In Swift, some of the differences is that a structure does not have to be initialized. Further more, comparing two structure with the strict equality comparison(===) will never return true. While a class may return true. The reason is because Structures only ever return copies of the value, even when you set struct A = struct B, while a class will pass along the objects address in memory.
 
 10. Objects on a computer are always stored in memory. The value type refers to the information stored in that place in memory, while a references type is the address of the object location in memory.
 
 11. Swift is a hard-retype language. With the use of the Any type, a varaible can easily be change from a Integer to a String without recasting.
 */
