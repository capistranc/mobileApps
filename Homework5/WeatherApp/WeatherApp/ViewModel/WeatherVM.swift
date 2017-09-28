//
// Weather VM
//  WeatherApp
//
//  Created by Mac on 9/19/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherVMDelegate:class{
    func getWeatherData(weatherStrings:[String])
    func getcityName(name:String)
}

class WeatherVM: NSObject {
    weak var delegate:WeatherVMDelegate?
    var forecast:[WeatherData] = []
    var currentCity:CityWeather?
    
    init(delegate:WeatherVMDelegate) {
        self.delegate = delegate
    }
    
    func initLocation(){
        GlobalFunctions.delay(seconds: 3){
            GlobalFunctions.getCityfromCurrentLocation{[unowned self] city in
                guard let city = city else {return}
                if self.currentCity == nil {
                    self.currentCity = city
                    self.updateForecast()
                    self.delegate?.getcityName(name: city.cityName)
                }
            }
        }
        
    }
    
    func updateForecast(){
        self.currentCity?.fetchWeatherData {
            guard let currentWeather = self.currentCity?.currentWeather else {return}
            guard var forecast:[WeatherData] = self.currentCity?.forecast else {return}
            
            forecast = [currentWeather] + forecast
            let forecastStr:[String] = forecast.flatMap{
                let date = NSDate(timeIntervalSince1970: Double($0.time))
                return "Date: \(date)\nStatus: \($0.status) \($0.statusInfo),\nHumidity: \($0.humidity)%, \nTemperature: \($0.temp)K,\n Low:\($0.tempMin)K, High:\($0.tempMax)K"
            }
            
            self.delegate?.getWeatherData(weatherStrings: forecastStr)
            guard let name = self.currentCity?.cityName else {return}
            self.delegate?.getcityName(name: name)
        }
    }
    
    func getTemp(weather:WeatherData) -> Double {
        return weather.temp
    }
    
}
