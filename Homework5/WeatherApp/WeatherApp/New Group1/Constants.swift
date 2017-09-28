//
//  Constants.swift
//  WeatherApp
//
//  Created by Mac on 9/20/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation

class Constants{
    static let kApiKey = "10bad4e58bff815c2a1f7d0036c1f20e"
    static let basePage = "https://api.openweathermap.org/data/2.5/"
    
    static let kCurrentByZip = basePage + "weather?zip="
    static let kCurrentByCity = basePage + "weather?q="
    
    static let k5DayByZip = basePage + "forecast?zip="
    static let k5DayByCity = basePage + "forecast?q="
    
}
