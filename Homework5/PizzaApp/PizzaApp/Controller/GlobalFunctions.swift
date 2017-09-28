//
//  GlobalFunctions.swift
//  PizzaApp
//
//  Created by Mac on 9/24/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation

//class GlobalFunctions {
//
//    func loadJson(){
//        do {
//            guard let path = Bundle.main.path(forResource: "assignment", ofType: ".json") else {return print("bad path")}
//            let data =  try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedRead)
//            guard let jsonDict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String:Any]] else {return}
//
//            let pizzas = jsonDict.flatMap{ ($0["toppings"] as? [String])?.sorted{$0 < $1}.joined(separator: ",")}
//            let set = NSCountedSet(array: pizzas)
//            let orderedArray:[String] = Array<String>(set.sorted{set.count(for: $0) > set.count(for: $1)})[0..<50]
//
//            print(orderedArray)
//            Cache.shared.topPizzas = orderedArray
//        } catch let error{
//            print("failed to load json: ", error)
//        }
//    }
//}

