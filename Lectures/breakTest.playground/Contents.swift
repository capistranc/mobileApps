//: Playground - noun: a place where people can play

import UIKit

var str = "Hijo de puta Xcode, pedaso de mierda"

//for _ in 1...500 {
//    queue.addOperation {
//        for char in str {
//            print(char, separator: "", terminator: " ")
//        }
//    }
//}

//let queue = OperationQueue()
//let op = BlockOperation {
//    for char in str {
//        print(char, separator: "", terminator:"")
//    }
//}
//
//var operations:[Operation] = []
//for _ in 1...10 {
//    operations.append(op)
////    queue.addOperation(op)
////    queue.waitUntilAllOperationsAreFinished()
//}

//queue.addOperations(operations, waitUntilFinished: false)
//op.start()
//op.waitUntilFinished()
//print("done")
//
//let queue = OperationQueue()
//class myOperation:Operation {
//    override func main() {
//        for char in str {
//
//        }
//    }
//}
//
//let op = myOperation()
//
//var operations:[Operation] = []
//for _ in 1...10 {
//    queue.addOperation(op)
//}


//
let opQueue = OperationQueue()

for i in 1...1000{
    opQueue.addOperation {
        print("one two three \(i) four seven")
    }
}
opQueue.waitUntilAllOperationsAreFinished()
print("done")

