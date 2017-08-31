//
//  MyButton.swift
//  Calculator
//
//  Created by Mac on 8/30/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit


class NumberButton:UIButton{
    @IBInspectable var num = 0
    func setNumber(value:Int) {
        self.num = value
    }
}
