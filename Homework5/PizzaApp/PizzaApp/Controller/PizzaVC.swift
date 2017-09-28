//
//  ViewController.swift
//  PizzaApp
//
//  Created by Mac on 9/19/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class PizzaVC: UITableViewController {
    lazy var pizzas:[String] = Cache.shared.topPizzas
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Top 50 Pizzas"
        self.tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "pizzaBackground"))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pizzas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {fatalError("bad cell id")}
        cell.textLabel?.text = "\(indexPath.row+1) \(pizzas[indexPath.row])"
        
        return cell
    }
    
}
