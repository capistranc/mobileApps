//HW assignment #1 - Create function that takes variable number of paramters and sums them
//If Int add it
//If String add 5
//Else subtract 10
//sumAny("Hello",2,6,2.0,"10") -> 8
//Bonus: Write it as a single return statement, with closures
//closure:= function that is treated as an object
import UIKit

func sumAny(_ params:Any...) -> Int{ //each case breaks after each case automatically
    var sum = 0
    for param in params{
        switch param {
        case let val as Int:
            sum += val
        case is String:
            sum += 5
        default:
            sum -= 10
        }
    }
    
    print(sum)
    return sum
}
sumAny(5,2,3,2.0,Float(9.9),"test","who dat")

var isInt: (Int) -> (Int) = { x in
    return x
}

func sumAny2(_ params:Any...) -> Int{
    return 0
}


var intToString: (Int) -> (String) = { x in
    let str = String(x)
    return "Hello \(str)"
}


print(intToString(5))


func sumAny3(_ params:Any...) -> Int{
    return params.map{
        switch $0{
        case let val as Int:
            return val
        case is String:
            return 5
        default:
            return -10
        }
        }.reduce(0){$0 + $1}
}



func sumAnyHard(_ params:Any...) -> Int{ //each case breaks after each case automatically
    var sum = 0
    for param in params{
        switch param {
        case let val as Int:
            sum += val
        case let str as String:
            if let val = Int(str){
                return -val
            }
            
        default:
            sum -= 10
        }
    }
    
    print(sum)
    return sum
}
sumAnyHard(5,2,3,2.0,Float(9.9),"test","who dat")