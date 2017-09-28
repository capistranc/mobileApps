//
//  CreatePizzaVM.swift
//  PizzaApp
//
//  Created by Mac on 9/25/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

protocol CreatePizzaDelegate:class {
    func didUpdateToppings(toppings:[String:Int])
}

class CreatePizzaVM{
    weak var delegate:CreatePizzaDelegate?
    var currentToppings:[String:Int] = [:]
    
    init(delegate:CreatePizzaDelegate){
        self.delegate = delegate
    }
    
    func addTopping(topping:String) {
        if let numTopping = currentToppings[topping] {
            currentToppings[topping] = numTopping + 1
        } else {
            currentToppings[topping] = 1
        }
        self.delegate?.didUpdateToppings(toppings: currentToppings)
    }
    
    func removeTopping(topping:String){
        guard let numTopping = currentToppings[topping] else {return}
        
        if numTopping > 0 {
            currentToppings[topping] = numTopping - 1
        } else {
//            currentToppings[topping] = nil
        }
        
        self.delegate?.didUpdateToppings(toppings: currentToppings)
    }
    
    func displayError(){
        
    }
}
