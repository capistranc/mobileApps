//
//  ToppingsCell.swift
//  PizzaApp
//
//  Created by Mac on 9/25/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

class ToppingsCell:UITableViewCell {
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var toppingLabel: UILabel!
    var name:String?
    
    lazy var vm:CreatePizzaVM = CreatePizzaVM(delegate: self)
    weak var tableDelegate:CreatePizzaVC?
    
    func setDelegate(delegate:CreatePizzaVC){
        self.tableDelegate = delegate
    }
    
    func fillCell(name:String){
        self.toppingLabel.text = name
        self.name = name
        
        guard let toppings = self.tableDelegate?.currentToppings else {return}
        self.quantityLabel?.text = "\(toppings[name] ?? 0)"
        self.quantityLabel?.sizeToFit()
    }
    
    @IBAction func addClicked(_ sender:UIButton){
        guard let name = self.toppingLabel.text else {return}
        vm.addTopping(topping: name)
    }
    
    @IBAction func subtractClicked(_ sender:UIButton){
        guard let name = self.toppingLabel.text else {return}
        vm.removeTopping(topping: name)
    }
    
}

extension ToppingsCell:CreatePizzaDelegate {
    func didUpdateToppings(toppings: [String:Int]) {
        self.tableDelegate?.didUpdateToppings(toppings: toppings)
        guard let name = self.name else {return}
            if let count = toppings[name] {
                self.quantityLabel?.text = "\(count)"
            } else {
                self.quantityLabel?.text = "0"
            }
        
    }
}
