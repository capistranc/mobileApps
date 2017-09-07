//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str1 = "Hello, playg r o,,und"
let str2 = "ttttt aaaa bb cb dd tt gg hh ll k s"


func countLetters(_ str:String) -> [String]{
    let charSet = CharacterSet(charactersIn: ", .")
    let strippedString = str.lowercased().components(separatedBy: charSet).joined()
    let countedSet = NSCountedSet(array: strippedString.characters.flatMap{String($0)})
    let sortedArray = countedSet.sorted{countedSet.count(for: $0) > countedSet.count(for: $1)}
    let maxIndex = min(9, sortedArray.count-1)
    let retValue:[String] = sortedArray[0...maxIndex].flatMap{String(describing: $0)}
    
    return retValue
}
func countLetters(_ str:[String])->[String]{
    let newStr = str.joined()
    return countLetters(newStr)
}

print(countLetters([str2, str1]))
