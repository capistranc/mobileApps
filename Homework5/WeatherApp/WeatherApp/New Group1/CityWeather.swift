//
//  CityWeather.swift
//  WeatherApp
//
//  Created by Mac on 9/23/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class CityWeather{
    let cityName:String
    let countryCode:String
    let zipCode:String?
    var currentWeather:WeatherData?
    var forecast:[WeatherData] = []
    
    init(name:String, zipCode:String? = nil, countryCode:String) {
        let zip = zipCode ?? "nil"
        self.zipCode = zip != "nil" ? zip : nil
        self.cityName = name
        self.countryCode = countryCode
    }
    
    func fetchWeatherData(callback:@escaping () -> ()) {
        let countryCode = self.countryCode
        var callString:String = ""
        var currentCallType:ApiPage = .currentByZip
        var fiveDayCallType:ApiPage = .fiveDayByZip
        
        if let zip = self.zipCode {
            callString = zip
            currentCallType = .currentByZip
            fiveDayCallType = .fiveDayByZip
        } else {
            callString = self.cityName.replacingOccurrences(of: " ", with: "")
            currentCallType = .currentByCity
            fiveDayCallType = .fiveDayByCity
        }
        
        Networking.callWeatherApi(callType: currentCallType, cityOrZip: callString, countryCode: countryCode) { (json, error) in
            guard error == nil else {return print(error!)}
            guard let json = json else {return print("bad json")}
            let currentWeather = WeatherData(json: json)
            self.currentWeather = currentWeather
        }
        
        Networking.callWeatherApi(callType: fiveDayCallType, cityOrZip: callString, countryCode: countryCode) { (json, error) in
            guard error == nil else {return print(error!)}
            guard let json = json else {return print("bad json")}
            
            guard let weatherList = json["list"] as? [[String:Any]] else {return print("no list?")}
            let forecast = weatherList.flatMap{WeatherData(json: $0)}
            self.forecast = forecast
            callback()
        }
    }
    
}



