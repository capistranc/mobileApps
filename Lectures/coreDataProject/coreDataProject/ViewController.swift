//
//  ViewController.swift
//  coreDataProject
//
//  Created by Mac on 9/20/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
    var names:[NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchFromCoreData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell") else {fatalError("bad cell id")}
        let person = names[indexPath.row]
        cell.textLabel?.text = person.value(forKey: "name") as? String
        
        return cell
    }
    
    func saveName(name:String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {fatalError("o wtf, we have no app delegate?")}
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "People", in: managedContext) else {fatalError("u didnt setup the entity rite")}
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        person.setValue(name, forKey: "name")
        do{
            try managedContext.save()
            names.append(person)
        } catch let err {
            print("F!@K: ",err)
        }
    }
    
    func fetchFromCoreData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {fatalError("o wtf, we have no app delegate?")}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "People")
        
        do {
            names = try managedContext.fetch(fetchRequest)
        } catch let error {
            print("I'm sorry mario, but princess is in another castillo, \(error)")
        }
    }
    
    @IBAction func addName(_ sender:AnyObject) {
        let alert = UIAlertController(title: "Add name", message: "Enter name to be added to list", preferredStyle: .alert)
        alert.addTextField{ (textField) in
            textField.placeholder = "Enter name here"
        }
        let add = UIAlertAction(title:"Add", style:.default){ [unowned self] (action) in
            guard let name = alert.textFields?[0].text else {return}
            self.saveName(name:name)
            
            self.tableView.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(add)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
    
}
