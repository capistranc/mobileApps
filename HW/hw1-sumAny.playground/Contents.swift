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
sumAny(5,99,-30,2.0,3.0,Float(9.9),"test","who dat")

var isInt: (Int) -> (Int) = { x in
    return x
}