//
//  ViewController.swift
//  EXTVC_iOSCat0821
//
//  Created by Alfonso Tapia on 8/31/17.
//  Copyright © 2017 BB. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var movies = ["Interstellar","Pulp Fiction", "StarWars", "The Hobbit", "Revolver", "Lock Stock and two smoking barrels","","","","","","","","","","","",""]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected: \(movies[indexPath.row])")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            fatalError("No cell created or bad identifier")
        }
        if indexPath.row == 0{
            cell.backgroundColor = .black
            cell.textLabel?.textColor = .white
        }
        cell.textLabel?.text = movies[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 200
        } else {
            return 45
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        guard identifier == "ToDetailView" else {return}
        guard let nextView = segue.destination as? DetailViewController else {return}
        guard let indexPath = self.tableView.indexPathForSelectedRow else {return}
        nextView.selectedMovie = movies[indexPath.row]
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

}

