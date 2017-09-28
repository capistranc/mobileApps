//
//  Cache.swift
//  PizzaApp
//
//  Created by Mac on 9/24/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

class Cache {
    static var shared = Cache()
    var topPizzas:[String] = []
    var toppings:Set<String> = Set<String>()
    var pizzaHistory:[[String:Int]] = [[:]]
}
