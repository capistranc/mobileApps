////: Playground - noun: a place where people can play
//
import UIKit

var str = "Hello, playground"

func sumAny(_ params:Any...) -> Int{
    return params.map{
        switch $0{
        case let val as Int:
            return val
        case is String:
            return 5
        default:
            return -10
        }
        }.reduce(0){$0 + $1} // (0) refers to initial result, $0 refers to the result, $1 refers to the current element of the array
}

//print(sumAny(1,5,3,8,3.0,"Hello"))

func multiply(ints:Int..., by number:Int) -> [Int] {
    return []
}

///Multiplying every entry of an array
//Method 1 bad
var myNumbers = [1,2,3,4,5,6,7,8,9]
var multipliedArray:[Int] = []
for number in myNumbers{
    multipliedArray.append(number * 2)
}

//print(multipliedArray)
//Method 2
var multipliedArray2 = myNumbers.flatMap{$0 * 2} //flat map does not return any nils, map may. i.e. myNums = [1,2,nil,3,nil] -> [1,2,3]
//print(multipliedArray2)

let myFunction = {
    print("Im a function!")
}

func myRunningFunctionFunction( number:Int, closure:()->() ){
    for _ in 0..<number{
        closure()
    }
}

//myRunningFunctionFunction {
//    print("closure")
//}
let myClosure = {print("Ciao")}

//myRunningFunctionFunction(number: 3, closure: myClosure)

let myArray = [1,2,3,4,5,6,7,8,9,0]

let myOtherArray = myArray.map{_ in "Hello"}
//print(myOtherArray)

let myStringArray = ["1","2","3","4","5","6","7","8","9","NaN"]
let myOtherArray2 = myStringArray.flatMap{ return Int($0)} //flatmap cannot return optionals, map will
//print(myOtherArray2)


let myArray3:[Any] = [1,"2","3","4","5","6","7","8","9","NaN"]
let myOtherArray3:[Int] = myArray3.flatMap{
    if let s = $0 as? String{
        return Int(s)
    } else if $0 is Int {
        return $0 as! Int
    } else{
        return nil
    }
}

//print(myOtherArray3)

let myStrArray:[String] = ["NaN2","2","3","4","asteroid", "sup dood", "5","6","7","8","9","NaN"]

let myNewArray:[Int] = myStrArray.flatMap{Int($0)}
//print(myNewArray)

let onlyNumbers = myStrArray.filter{Int($0) != nil}
//print(onlyNumbers)

let notNumbers = myStrArray.filter{Int($0) == nil}
//print(notNumbers)

let firstLetterN = myStrArray.filter{$0.lowercased().characters.first == "n"} //or can use uppercased
//print(firstLetterN)

let sorted = myStrArray.sorted{$0 < $1}
//print(sorted)

let myNumberArray = [6,4,8,6,1,0,4,3,7]
//print(myNumberArray.sorted{$0<$1})

let myString = "Hello ho,w a,re you"
let charSet = CharacterSet(charactersIn: " ,")
let arrayOfWords = myString.components(separatedBy: charSet) // or can just do seperatedBy: " "
//print(arrayOfWords)
let myStringWithCommas = arrayOfWords.joined(separator: ",")
//print(myStringWithCommas)


String has a number, then return that number in negative
String has no number, return 5
ignored repeated numbers, Just on the ints


func sumAny2(_ params:Any...) -> Int{
    var intArray:[Int] = []
    var anyArray:[Any] = []
    for param in params {
        if let val = param as? Int {
            intArray.append(val)
        } else {
            anyArray.append(param)
        }
    }
    let newParams:[Any] = anyArray + Array(Set<Int>(intArray))
    
    return newParams.map{
        switch $0{
        case let val as Int:
            
            return val
        case let str as String:
            let intArray = str.characters.filter{Int(String($0)) != nil}.flatMap{Int(String($0)) }
            let value = intArray.reduce(0){$0 + $1}
            return value == 0 ? 5 : -value
        default:
            return -10
        }
        }.reduce(0){$0 + $1} // (0) refers to initial result, $0 refers to the running result, $1 refers to the current element of the array
}


print(sumAny2(1,2,3,3,3,5,"5 times 5", "ciao 1", "5.0", 2.0)) //1 + 2 + 3 + 5 - 10 - 1 - 5 - 10


func mostRepeatedNumber (nums:[Int]) -> Int{
    var hash = [Int: Int]()
    
    for i in nums{
        guard let count = hash[i] else {
            hash.updateValue(1, forKey: i)
            continue
        }
        hash.updateValue(count+1, forKey: i)
    }
    guard let ret = (hash.max{ a, b in a.value < b.value }) else {
        return 0
    }
    
    return ret.key
}

let myArrayOfNumbers = [1,1,2,2,3,3,3,3,3,3,3,3,3, 4,4,5,5,5,5,6,6,6,7]
print(mostRepeatedNumber(nums: myArrayOfNumbers))

let counted:NSCountedSet = NSCountedSet(array: myArrayOfNumbers)

for number in counted{
    print("The number \(number) is repeated \(counted.count(for: number)) times")
}

print(counted.count(for: 3))



