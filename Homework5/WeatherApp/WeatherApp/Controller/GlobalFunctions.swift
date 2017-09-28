//
//  GlobalFunctions.swift
//  mapViewExample
//
//  Created by Mac on 9/21/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class GlobalFunctions:NSObject {
    
    static func delay(seconds:Double, action:@escaping () -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + seconds, execute: action)
    }
    
    static func getCityfromCurrentLocation(completion:@escaping (CityWeather?)->()){
        DispatchQueue.main.async {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {fatalError("TF HAPPENED TO OUR APP DELEGATE?")}
        let locationManager = appDelegate.locationManager
        guard let loc = locationManager.location else {return completion(nil)}
        
        CLGeocoder().reverseGeocodeLocation(loc) { (placemark, error) in
            guard error == nil else {return print(error!.localizedDescription)}
            guard error == nil else {
                return print(error!.localizedDescription)
            }
            guard let place = placemark?[0] else {return print("noplace")}
            guard let name = place.locality else {return print("noname")}
            guard let countryCode = place.isoCountryCode else {return print("noCountry")}
            let zip = place.postalCode ?? nil
            let city = CityWeather(name: name, zipCode: zip, countryCode: countryCode)
            completion(city)
        }
        }
    }
    
}


