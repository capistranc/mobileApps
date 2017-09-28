//
//  Constants.swift
//  NetworkingUnitTests
//
//  Created by Mac on 9/20/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation

class Constants {
    static let kUserNameKey = "com.networkunittesting.BrighterBrain.UserName"
    static func kUserKCKey(userName:String)->String{
        return "com.networkunittesting.BrighterBrain.Password.\(userName)"
    }
}
