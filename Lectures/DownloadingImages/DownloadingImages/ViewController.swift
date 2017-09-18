//
//  ViewController.swift
//  DownloadingImages
//
//  Created by Alfonso Tapia on 9/14/17.
//  Copyright © 2017 BB. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var namesArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        namesArray = ["Ackbar","HanSolo","LukeSkywalker","Palpatine","LeiaOrgana","Chewbacca","R2-D2","C-3PO","AdiGallia","AnakinSkywalker","Bossk","BeruWhitesunlars","DarthMaul","DarthVader","Finn","Gasgano","Greedo","Grievous","JocastaNu"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell") as? CustomTableViewCell else {
            fatalError("Your cell is messed up")
        }
        let name = namesArray[indexPath.row]
        cell.fillCell(name:name)
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }


}

