//
//  Networking.swift
//  WeatherApp
//
//  Created by Mac on 9/20/17.
//  Copyright © 2017 Mac. All rights reserved.
//
import Foundation
import UIKit

enum ApiPage {
    case currentByCity
    case fiveDayByCity
    case currentByZip
    case fiveDayByZip
    
    func setPage(name:String, countryCode: String) -> String {
    
        switch self {
        case .currentByCity:
            return Constants.kCurrentByCity + "\(name),\(countryCode)&appid=\(Constants.kApiKey)"
        case .fiveDayByCity:
            return Constants.k5DayByCity + "\(name),\(countryCode)&appid=\(Constants.kApiKey)"
        case .currentByZip:
            return Constants.kCurrentByZip + "\(name),\(countryCode)&appid=\(Constants.kApiKey)"
        case .fiveDayByZip:
            return Constants.k5DayByZip  + "\(name),\(countryCode)&appid=\(Constants.kApiKey)"
        }
    }
}

enum NetworkingError:Error {
    case BadApi(String)
    case BadData
    case BadResponse(Int)
}

class Networking:Codable {
    static func callWeatherApi(callType:ApiPage, cityOrZip:String, countryCode:String, completion:@escaping ([String:Any]?, NetworkingError?)->()) {
        let page = callType.setPage(name:cityOrZip, countryCode: countryCode)
        guard let url = URL(string: page) else {return completion(nil, .BadApi("bad url"))}
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, res, error) in
            guard error == nil else {return completion(nil, .BadApi(error!.localizedDescription))}
            guard let res = res as? HTTPURLResponse else {return}
            guard res.statusCode == 200 else {return completion(nil, .BadResponse(res.statusCode))}
            
            guard let data = data else {return completion(nil, .BadData)}
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                guard let dictionary = json as? [String:Any] else {return print("bad json")}
                completion(dictionary, nil)
            } catch let err{
                print("something went wrong,", err)
            }
        }
        task.resume()
    }
    
//    static func getPokemonImage(callType:PokeImageType, forId id:Int?, completion:@escaping (UIImage?, NetworkingError?)->()) {
//        var urlString = callType.setImageLocation()
//        if let idStr = id {urlString = urlString + "\(idStr).png"}
//
//        guard let url = URL(string: urlString) else {return completion(nil, .BadApi("bad url"))}
//
//        let session = URLSession.shared
//        let task = session.dataTask(with: url) { (data, response, error) in
//            guard error == nil else {return completion(nil, .BadApi(error!.localizedDescription))}
//            guard let res = response as? HTTPURLResponse else {return}
//            guard res.statusCode == 200 else {return completion(nil, .BadResponse(res.statusCode))}
//            guard let data = data else {return print("bad data")}
//            guard let image = UIImage(data:data) else {return print("bad image data")}
//
//            if let idNum = id {
//                image.accessibilityIdentifier = "\(idNum)"
//            } else {
//                image.accessibilityIdentifier = "background"
//            }
//            completion(image, nil)
//        }
//        task.resume()
//    }
}

