//
//  CityWeather.swift
//  WeatherApp
//
//  Created by Mac on 9/23/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

public struct WeatherData{
    let time:Int
    let status:String
    let statusInfo:String
    let temp:Double
    let humidity:Int
    let tempMin:Double
    let tempMax:Double
    
    init?(json:[String:Any]) {
        guard let time = json["dt"] as? Int else {return nil}
        
        guard let weatherJson = json["weather"] as? [[String:Any]]else {print("noweather");return nil}
        guard let status = weatherJson[0]["main"] as? String else {print("nostatus");return nil}
        guard let statusInfo = weatherJson[0]["description"] as? String else {print("nosinfo");return nil}
        
        guard let tempJson = json["main"] as? [String:Any] else {print("nomain");return nil}
        guard let temp = tempJson["temp"] as? Double else {print("tempjson");return nil}
//        guard let pressure = tempJson["pressure"] as? Int else {print("pressure");return nil}
        guard let humidity = tempJson["humidity"] as? Int else {print("humidity");return nil}
        guard let tempMin = tempJson["temp_min"] as? Double else {print("lowtemp");return nil}
        guard let tempMax = tempJson["temp_max"] as? Double else {print("hightemp");return nil}
        
        self.time = time
        self.status = status
        self.statusInfo = statusInfo
        
        self.temp = temp
//        self.pressure = pressure
        self.humidity = humidity
        self.tempMax = tempMax
        self.tempMin = tempMin
    }
}


//JSON ENCODING IN SWIFT 4 IS THE MOST USELESS PIECE OF SHIT EVER MADE. LOOK AT CODE BELOW TO SEE WHY
//
//struct mainData:Codable {
//    let temp
//}

//public struct WeatherData : Decodable {
//    let time:Int
//    let cityName:String
//    let majorDescription:String
//    let minorDescription:String
////    let temp:Double
////    let pressure:Int
////    let humidity:Int
////    let tempMin:Double
////    let tempMax:Double
//
//    private enum CodingKeys: String, CodingKey {
//        case time = "dt", weather, tempInfo="main", cityName="name"
//    }
//    private enum WeatherKeys:String, CodingKey {
//        case majorDescription="main",minorDescription="description"
//    }
////    private enum TempInfoKeys: String, CodingKey {
////        case temp, pressure, humidity,tempMin = "temp_min", tempMax="temp_max"
////    }
//}

//extension WeatherData { //DEFEATS WHOLE PURPOSE OF ENCODING WTF
//    public init(from decoder: Decoder) throws {
//        let mainObject = try decoder.container(keyedBy: CodingKeys.self)
//        let time = try mainObject.decode(Int.self, forKey: .time)
//        let cityName = try mainObject.decode(String.self, forKey: .cityName)
//
//        let weatherObject = try mainObject.nestedContainer(keyedBy: WeatherKeys.self, forKey: .weather)
//        let majorDesc = try weatherObject.decode(String.self, forKey: .majorDescription)
//        let minorDesc = try weatherObject.decode(String.self, forKey: .minorDescription)
//        self.init(time:time, cityName: cityName, majorDescription:majorDesc, minorDescription: minorDesc)
////        self.init(time:time, weather:weather, tempInfo:tempInfo, cityName:cityName, majorDescription:majorDescription, minorDescription:minorDescription, temp:temp, pressure:pressure, humidity:humidity, tempMin:tempMin, tempMax:tempMax)
//    }
//}

