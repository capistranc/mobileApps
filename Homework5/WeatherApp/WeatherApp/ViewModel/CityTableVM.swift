//
//  viewModel.swift
//  WeatherApp
//
//  Created by Mac on 9/19/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

protocol CityTableVMDelegate:class{
    func getCityList(cities:[CityWeather])
}

class CityTableVM: NSObject {
    weak var delegate:CityTableVMDelegate?
    var cities:[CityWeather] = []
    var currentyCity:CityWeather?
    
    weak var locationManager: CLLocationManager?
    
    init(delegate:CityTableVMDelegate) {
        self.delegate = delegate
    }
    
    func initLocationManager(){
        DispatchQueue.main.async {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {fatalError("TF HAPPENED TO OUR APP DELEGATE?")}
            self.locationManager = appDelegate.locationManager
        }
    }
    
    func getCityFromString(str:String, completion:@escaping (CityWeather) -> ()) {
        CLGeocoder().geocodeAddressString(str){ (placemark, error) in
            guard error == nil else {return print(error!.localizedDescription)}
            guard let place = placemark?[0] else {return print("noplace")}
            guard let name = place.locality else {return print("noname")}
            guard let countryCode = place.isoCountryCode else {return print("noCountry")}
            let zip = place.postalCode ?? nil
            
            let cityWeather = CityWeather(name: name, zipCode: zip, countryCode: countryCode)
            completion(cityWeather)
        }
    }
    

    
    func addCity(_ city:CityWeather){
        DispatchQueue.main.async {
            self.cities.append(city)
            CoreFunctions.saveCity(newCity: city)
            self.delegate?.getCityList(cities: self.cities)
        }
    }
    
    func removeCity(_ city:CityWeather) {
        DispatchQueue.main.async {
            self.cities = self.cities.filter{$0.cityName != city.cityName}
            CoreFunctions.deleteCity(city: city)
            self.delegate?.getCityList(cities: self.cities)
        }
    }
    
    func loadCitiesFromCore(){
        DispatchQueue.main.async {
            self.cities = CoreFunctions.fetchFromCoreData()
            self.delegate?.getCityList(cities: self.cities)
        }
    }
    

    
    func setCurrentLocation(city:CityWeather) {
        DispatchQueue.main.async{
            self.currentyCity = city
            city.fetchWeatherData(){ [unowned self] in
                self.delegate?.getCityList(cities: self.cities)
            }
        }
    }
    
}

//extension CityTableVM:CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let loc =  locations.last else {return print("No locations?")}
//
//    }
//
//}

