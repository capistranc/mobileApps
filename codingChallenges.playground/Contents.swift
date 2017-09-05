//: Playground - noun: a place where people can play

import UIKit


var str1 = "Hello World"
var str2 = "tacocat"
var str3 = "dood"
//Challenge 3
func checkPalindrome(inputString: String) -> Bool {
    let len = inputString.characters.count
    if len == 0 || len == 1{ return true}
    if inputString.characters.first != inputString.characters.last {return false}
    
    let str = String(inputString.characters.dropLast().dropFirst())
    return checkPalindrome(inputString: str)
}
//print(checkPalindrome(inputString: str2))

let str4 = "abcdefghijklmnopqrstuvwxyzab"
func stringReverse(str:String) -> String{
    return String(str.characters.reversed())
}

// func checkPalindrome(inputString: String) -> Bool {
//     if inputString == "" {return true}
//     return checkPalindrome(charArray: inputString.characters.map { $0 } )
// }
// func checkPalindrome(charArray: [Character]) -> Bool {
//     if charArray.count == 1 || charArray.count == 0 { return true}
//     if charArray.first != charArray.last {return false}

//     let newArray = charArray.dropLast().dropFirst().map{ $0 }
//     return checkPalindrome(charArray: newArray)
// }

let str5 = str4 + "q" + "x" + stringReverse(str: str4)
//print(str5)
//print(checkPalindrome(inputString: str5))

func adjacentElementsProduct(inputArray: [Int]) -> Int {
    var maxProduct = Int.min
    for (i, num) in inputArray[0..<inputArray.count-1].enumerated() {
        maxProduct = max(maxProduct,num * inputArray[i+1])
    }
    return maxProduct
}

//Ex: Interesting Polygon
//Notice how each step, the area increases by 4* the value of n-1
//1 4 8 12 16
//n=1 A = 1
//n=2 A = 1 + 4
//n=3 A = 1 + 4 + 8 = 1 + 4(1 + 2)
//n=4 A = 1 + 4 + 8 + 12 = 1 + 4*(1 + 2 + 3)
//=> A = 1 + 4 * (n-1)(n) / 2 = 1 + 2*(n-1)*n
func shapeArea(n: Int) -> Int {
    
    return 1 + (2 * n * (n-1))
}

//
func makeArrayConsecutive2(statues: [Int]) -> Int {
    guard let maxVal = statues.max() else {return 0}
    guard let minVal = statues.min() else {return 0}
    
    
    return max(0, maxVal - minVal - statues.count + 1)
}


//
let seq1 = [1, 3, 2, 1]
let seq2 = [10, 1, 2, 3, 4, 5]
let seq3 = [40, 50, 60, 10, 20, 30]

//func almostIncreasingSequence2(sequence: [Int]) -> Bool {
//    var deletedNumIndex = -1
//    for (i, num) in sequence[0..<(sequence.count-1)].enumerated() {
//        print(i, num, sequence[i+1])
//        if num >= sequence[i+1] {
//            if deletedNumIndex == -1 {
//                deletedNumIndex = i
//            }
//        }
//        
//        if deletedNumIndex != -1 && deletedNumIndex > 1 && num >= sequence[deletedNumIndex-1] {
//            print(sequence[deletedNumIndex])
//            return false}
//    }
//    return true
//}

//func almostIncreasingSequence(sequence: [Int]) -> Bool {
//    
//    let set = Set(sequence)
//    let sortedSequence = set.sorted{$0 < $1}
////    print(sortedSequence)
//    
//    let offSet = sequence.count - sortedSequence.count
//    if offSet > 1 {return false} // If there are more than 2 repeats return false
//    
//    for (i,num) in sequence[0..<(sequence.count-1)].enumerated() { //If
//        if num >= sequence[i+1] {
//            let num2 = sequence[i+1]
////            print(sequence.filter{$0 != sequence[i+1]})
////            print(sequence.filter{$0 != num})
//            return sequence.filter{$0 != num2} == sortedSequence.filter{$0 !=  num2} || sequence.filter{$0 != num} == sortedSequence.filter{$0 != num}
//        }
//    }
//    return true
//}

func almostIncreasingSequence(sequence: [Int]) -> Bool {
    var j = -1
    var deleteFlag = false
    let len = sequence.count
    let set = Set(sequence)
    if (len - set.count > 1) {return false}
    
    for i in 0..<len-1 {
        if sequence[i] >= sequence[i+1] {
            if (j == -1) {
                j = i+1
                continue
            } else {
                return false
            }
        }
    }
    
    if (j == -1) {return true}
    for i in 0..<len-1 {
        if sequence[i] > sequence[j] && i < j {
            guard deleteFlag == false else {return false}
            deleteFlag = true
        }
    }
    return true
}
//
print(almostIncreasingSequence(sequence: seq1))
print(almostIncreasingSequence(sequence: seq2))
print(almostIncreasingSequence(sequence: seq3))
