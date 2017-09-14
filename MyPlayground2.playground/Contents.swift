//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let str2 = "https://pokeapi.co/api/v2/pokemon-species/1/"

print(str2.components(separatedBy: "/").filter{$0 != ""}.last)