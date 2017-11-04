//
//  ViewController.swift
//  operationsQueue
//
//  Created by Mac on 9/27/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let op = MyOperation(withWord: "WHAT DO YOU WANT FROM ME")
        op.start()
//        op.start(words: "WHAT DO YOU WANT FROM ME")
        op.waitUntilFinished()
        print("done")
        
        var ops:[Operation] = []
        for i in 0...1000 {
            let op = MyOperation(withWord: "I wanna blame GODOHALDO")
            ops.append(op)
            guard i > 0 else {continue}
            op.addDependency(ops[i-1])
        }
        
        let queue = OperationQueue()
        queue.addOperations(ops, waitUntilFinished: true)
        print("done2")
        
//        let queue = OperationQueue()
//        var ops:[Operation] = []
//        for i in 0...2000 {
//            let op = BlockOperation{
//                for char in str {
//                    print("\(i)\(char)", terminator: " ")
//                }
//            }
//            ops.append(op)
//        }
//        queue.addOperations(ops, waitUntilFinished: true)
//        print("done")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

