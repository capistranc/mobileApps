//
//  MyButton.swift
//  Calculator
//
//  Created by Mac on 8/30/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

enum Operation:String{
    case plus = "+"
    case minus = "-"
    case divide = "/"
    case multiply = "*"
    case equals = "="
    case negate = "!"
    case decimal = "."
    
    case undo = "<-"
    case clear = "C"
    case none = " "
}

class OperationButton:UIButton{
    @IBInspectable var operation:Operation = .clear
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        // set other operations after super.init, if required
    }
    
    func setOperation(to op:Operation) {
        self.operation = op
    }
}
