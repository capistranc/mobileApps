//
//  ViewController.swift
//  networkingExample
//
//  Created by Mac on 9/7/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var myArray:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let networking = Networking()
        networking.delegate = self
        networking.callSWapi(pageNumber: 1)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {fatalError("bad cell identifier")}
        cell.textLabel?.text = myArray?[indexPath.row]
        return cell
    }
    
}

extension ViewController:NetworkingDelegate {
    func apiDidReturnWithObject(names:[String]) {
        DispatchQueue.main.async { // should only be used for UI updates
            if self.myArray != nil {
                self.myArray?.append(contentsOf: names)
            } else {
                self.myArray = names
            }
            self.tableView.reloadData()
        }
        
        //DispatchQueue.global is the background threads
        //sync typically used on background threads i.e. global
    }
    
    func apiDidFailWithError(error: String) {
        print("we don goofed: \(error)")
    }
    
    func apiResponseFailure(statusCode: Int) {
        print("bad response code!: \(statusCode)")
    }
}

