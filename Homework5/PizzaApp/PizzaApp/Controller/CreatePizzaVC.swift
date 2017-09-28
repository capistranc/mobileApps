//
//  CreatePizzaVC.swift
//  PizzaApp
//
//  Created by Mac on 9/25/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

class CreatePizzaVC: UITableViewController {
    lazy var toppings = Array<String>(Cache.shared.toppings)
    lazy var vm = CreatePizzaVM(delegate: self)
    var currentToppings:[String:Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Create your own pizza"
        self.tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "pizzaBackground"))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return CGFloat(130)
        }
        return CGFloat(60)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return self.toppings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PizzaCell") else {fatalError("bad cell id")}
            var label:[String] = []
//            print(self.currentToppings)
            for item in self.currentToppings{
                if item.value != 0 {
                label.append(item.key + ": \(item.value) ")
                }
            }
            cell.textLabel?.text = "Current Pizza: " + label.joined()
            cell.textLabel?.sizeToFit()
            cell.textLabel?.numberOfLines = 0
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToppingCell")  as? ToppingsCell else {fatalError("bad cell id")}
            cell.fillCell(name: toppings[indexPath.row])
            cell.setDelegate(delegate: self)
            return cell
        }
    }
}

extension CreatePizzaVC:CreatePizzaDelegate {
    func didUpdateToppings(toppings: [String : Int]) {
        DispatchQueue.main.async {
            for item in toppings{
                self.currentToppings[item.key] = item.value
            }
            
            let cellIndicies = self.tableView.visibleCells.flatMap{self.tableView.indexPath(for: $0)}
            if let sectionIndex = (cellIndicies.filter{$0.section == 0}).first {
                self.tableView.reloadRows(at: [sectionIndex], with: .none)
            }
            
        }
    }
}

