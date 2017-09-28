//
//  CityTableVC.swift
//  WeatherApp
//
//  Created by Mac on 9/24/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit


protocol CitySelectionDelegate:class{
    func citySelected(city:CityWeather)
}

class CityTableVC:UITableViewController, UISearchBarDelegate {
    lazy var vm:CityTableVM = CityTableVM(delegate: self)
    weak var selectionDelegate:CitySelectionDelegate?
    var cities:[CityWeather] = []
    let searchController = UISearchController(searchResultsController: nil)
    //    var removeCitiesToggled = false
    
    //    @IBOutlet weak var removeCitiesButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //    @IBAction func exitView(_ sender:Any){
    //        dismiss(animated: true)
    //    }
    //
    //    @IBAction func removeCitiesButtonClicked(_ sender:Any){
    //        DispatchQueue.main.async{
    //            self.removeCitiesToggled = !self.removeCitiesToggled
    //        }
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "citiesBackground"))
        vm.loadCitiesFromCore()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let locationString = searchBar.text, !locationString.isEmpty {
            print("get here?")
            vm.getCityFromString(str: locationString){ [unowned self] city in
                self.vm.addCity(city)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let city = cities[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        self.selectionDelegate?.citySelected(city: city)
        dismiss(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") else {fatalError("bad cell")}
        let text = cities[indexPath.row].cityName
        
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = .white
        

        cell.textLabel?.sizeToFit()
        
        return cell
    }
}

extension CityTableVC:CityTableVMDelegate {
    func getCityList(cities:[CityWeather]) {
        self.cities = cities
        self.tableView.reloadData()
    }
}

