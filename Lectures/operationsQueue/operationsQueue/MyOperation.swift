//
//  MyOperation.swift
//  operationsQueue
//
//  Created by Mac on 9/27/17.
//  Copyright © 2017 Mac. All rights reserved.
//
//Create a matrix of 10x10 with random numbers from 0 to 9 in each entry
//
//Due thursday 11:59pm

import Foundation

class MyOperation:Operation {
    private var done = false
    private var string:String
    
    init(withWord:String){
        self.string = withWord
    }
    
    override func main(){
//        let str = "Blame Godohaldo for this"
        for char in self.string {
            print(char, separator: "", terminator: " ")
        }
        isFinished = true
    }
    
    override var isFinished: Bool {
        get {
            return done
        }
        set {
            self.done = newValue
        }
    }
    
    //    func start(words:String) {
    //        self.string = words
    //        super.start()
    //    }
}
