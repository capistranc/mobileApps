//: Playground - noun: a place where people can play

import UIKit

var nums = [1,2,3]
var str = ["one","two","three"]

let x = zip(nums,str)

print(x)


let pairs = x.map{($0,$1)}
print(pairs)
