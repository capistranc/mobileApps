//
//  GlobalFunctions.swift
//  mapViewExample
//
//  Created by Mac on 9/21/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation

class GlobalFunctions {
    static func delay(seconds:Double, action:@escaping () -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + seconds, execute: action)
    }
    
}
