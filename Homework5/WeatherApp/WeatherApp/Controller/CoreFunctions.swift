//
//  CoreFunctions.swift
//  WeatherApp
//
//  Created by Mac on 9/24/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreFunctions {
    
    static func saveCity(newCity:CityWeather){
        let name = newCity.cityName
        let countryCode = newCity.countryCode
        let zipCode = newCity.zipCode ?? "nil"
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {fatalError("o wtf, we have no app delegate?")}
        let managedContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "City", in: managedContext) else {fatalError("Didn't setup entity")}
        let city = NSManagedObject(entity: entity, insertInto: managedContext)
        city.setValue(name, forKey: "name")
        city.setValue(zipCode, forKey:"zipCode")
        city.setValue(countryCode, forKey:"countryCode")
        
        do {
            try managedContext.save()
        } catch let err {
            print("failed to saveCity", err)
        }
        print("city saved!")
    }
    
    static func deleteCity(city:CityWeather){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {fatalError("wtf m8? where ur app go")}
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "City")
        //        guard let zip = city.zipCode else {return}
        let name = city.cityName
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let citiesMoc = try context.fetch(fetchRequest)
            
            for city in citiesMoc {
                context.delete(city)
                //                print("deleted: \(city)")
            }
            try context.save()
        } catch let error {
            print("we don goofed", error)
        }
    }
    
    static func fetchFromCoreData()->[CityWeather]{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {fatalError("wtf m8? where ur app go")}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "City")
        
        do {
            let citiesMoc = try managedContext.fetch(fetchRequest)
            
            var cities:[CityWeather] = []
            for cityMoc in citiesMoc {
                guard let name = cityMoc.value(forKey: "name") as? String else {return []}
                guard let zipCode =  cityMoc.value(forKey: "zipCode") as? String else {return []}
                guard let countryCode = cityMoc.value(forKey: "countryCode") as? String else {return []}
                cities.append(CityWeather(name: name, zipCode: zipCode, countryCode:countryCode))
            }
            
            return cities
        } catch let error {
            print("sorry m8, got no data \(error)")
        }
        return []
    }
    
}

