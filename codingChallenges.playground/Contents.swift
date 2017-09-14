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

//let seq1 = [1, 3, 2, 1]
//let seq2 = [10, 1, 2, 3, 4, 9, 5]
//let seq3 = [40, 50, 60, 10, 20, 30]


//func almostIncreasingSequence(sequence: [Int]) -> Bool {
//    let len = sequence.count
//    let set = Set(sequence)
//    if (len - set.count > 1) {return false}
//    var indexToRemove:Int?
//    
//    for i in 1..<len-1 { // 3 cases
//        let val = (sequence[i-1], sequence[i], sequence[i+1]) // left < middle < right
//        switch val
//        {
//        case let (x,y,z) where x >= y && x >= z: //left > middle, left > right
//            indexToRemove = i-1
//        case let (x,y,z) where x >= y &&  x <= z: //left > middle, left < right
//            indexToRemove = i
//        case let (x,y,z) where y >= z && i+1 == len-1: // middle > right
//            if x > z {
//                indexToRemove = i+1
//            } else {
//                indexToRemove = i
//            }
//            break
//        default:
//            break
//        }
//    }
//    
//    guard let index = indexToRemove else {return true}
//    var newArray = sequence
//    newArray.remove(at: index)
//    if newArray.count == 2 && newArray[0] >= newArray[1]{
//        return false
//    }
//    
//    for i in 1..<newArray.count-1 { // 3 cases
//        let val = (newArray[i-1], newArray[i], newArray[i+1]) // left < middle < right
//        switch val
//        {
//        case let (x,y,z) where x >= y && x >= z: //left > middle, left > right
//            return false
//        case let (x,y,z) where x >= y &&  x <= z: //left > middle, left < right
//            return false
//        case let (x,y,z) where y >= z && i+1 == newArray.count-1: // middle > right
//            if x > z {
//                return false
//            } else {
//                return false
//            }
//            break
//        default:
//            break
//        }
//    }
//    return true
//}

//
//print(almostIncreasingSequence(sequence: [3,2,1]))
//print(almostIncreasingSequence(sequence: seq2))
//print(almostIncreasingSequence(sequence: seq3))

//let matrix = [[0, 1, 1, 2],
//          [0, 5, 0, 0],
//          [2, 0, 3, 3]]
//
//func matrixElementsSum(matrix: [[Int]]) -> Int {
//    var zeroCols = Set<Int>()
//    var newMatrix:[[Int]] = [[]]
//    
//    for row in matrix {
//        var newRow:[Int] = []
//        for (i, colEntry) in row.enumerated() {
//            if zeroCols.contains(i) {
//                newRow.append(0)
//            } else {
//                if colEntry == 0 {
//                    zeroCols.insert(i)
//                }
//                newRow.append(colEntry)
//            }
//        }
//        newMatrix.append(newRow)
//    }
//
//    return newMatrix.reduce([]){$0 + $1}.reduce(0){$0 + $1}
//}
//
//print(matrixElementsSum(matrix: matrix))

//let s1 = "aabccz"
//let s2 = "adcaax"
//
//func commonCharacterCount(s1: String, s2: String) -> Int {
//    var set1 = NSCountedSet(array: s1.characters.filter{s2.characters.contains($0)}.flatMap{String($0)})
//    var set2 = NSCountedSet(array: s2.characters.filter{s1.characters.contains($0)}.flatMap{String($0)})
//    
//    var count = 0
//    set1.map{
//        count += min(set1.count(for: $0),set2.count(for: $0))
//    }
//    return count
//}
//
//print(commonCharacterCount(s1: s1, s2: s2))

//let val1 = 303321
//let val2 = 4223
//let val3 = 325
//
//o(n) time, o(1) space
//func isLucky(n: Int) -> Bool {
//    let len = String(describing: n).characters.count
//    var num = n, lhs = 0, rhs = 0
//    for _ in 1...len {
//        let val = num % 10
//        if String(num).characters.count > len/2 {
//            rhs += val
//        } else {
//            lhs += val
//        }
//        num = num / 10
//        
//    }
//    return lhs==rhs
//}
//print(isLucky(n: val1))
//print(isLucky(n: val2))
//print(isLucky(n: val3))

//let a = [-1, 150, 190, 170, -1, -1, 160, 180]
//func sortByHeight(a: [Int]) -> [Int] {
//    var treeIndicies:[Int] = []
//    for (i,val) in a.enumerated() {
//        if val == -1 {
//            treeIndicies.append(i)
//        }
//    }
//    
//    var sortedArr = a.filter{$0 != -1}.sorted{$0<$1}
//    treeIndicies.map{sortedArr.insert(-1, at: $0)}
//    
//    return sortedArr
//}
//
//print(sortByHeight(a: a))

let s1 = "a(bc)de"
let s2 = "co(de(fight)s)"
let s3 = "Code(Cha(lle)nge)"

print(Array(s3.characters))
func reverseParentheses(s: String) -> String {
    var leftIndicies:[Int] = [], rightIndicies:[Int] = []
    var chars:[Character] = Array(s.characters)
    
    for (i,char) in s.characters.enumerated() {
        if char == "(" {
            leftIndicies.append(i)
        } else if char == ")" {
            rightIndicies.append(i)
        }
    }
    guard leftIndicies.count == rightIndicies.count else {return ""}
    if leftIndicies.isEmpty {return s}
    
    reverse(leftIndex: &leftIndicies, rightIndex: &rightIndicies, chars: chars)
    return s
}

func reverse(leftIndex:inout [Int], rightIndex:inout [Int], chars: [Character]) -> [Character] {
     
    return []
}
reverseParentheses(s: s1)
