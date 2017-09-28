//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by Mac on 9/19/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class WeatherVC: UITableViewController{
    lazy var vm:WeatherVM = WeatherVM(delegate: self)
    var formattedWeather:[String] = []
    var city:String?
    let loadingSpinner = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.initLocation()
        self.tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "sunnyBackground"))
        loadingSpinner.activityIndicatorViewStyle = .gray
        loadingSpinner.hidesWhenStopped = true
        loadingSpinner.startAnimating()
        loadingSpinner.frame = self.view.bounds
        loadingSpinner.transform = CGAffineTransform.init(scaleX: 2.0, y: 2.0)
        loadingSpinner.center = self.view.center
        loadingSpinner.color = .gray
        self.tableView.backgroundView?.addSubview(self.loadingSpinner)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(130.00)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.formattedWeather.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {fatalError("bad cell")}
        cell.textLabel?.text = self.formattedWeather[indexPath.row]
        cell.textLabel?.sizeToFit()
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textColor = .white
        return cell
    }
    
    @IBAction func showCities(_ sender:UIButton) {
        guard let selectVC = storyboard?.instantiateViewController(withIdentifier: "CityTable") as? CityTableVC else {return}
        selectVC.selectionDelegate = self
        self.present(selectVC, animated: true)
    }
    
    func assignBackground(status:String){
        DispatchQueue.main.async {
        let imageView = UIImageView()
        switch status {
        case "Rain":
            fallthrough
        case "Drizzle":
            imageView.image = #imageLiteral(resourceName: "rainyBackground")
            break
        case "Clouds":
            imageView.image = #imageLiteral(resourceName: "cloudyBackground")
        default:
            imageView.image = #imageLiteral(resourceName: "sunnyBackground")
        }
            self.tableView.backgroundView = imageView
            self.loadingSpinner.stopAnimating()
            self.tableView.reloadData()
        }
    }
}

extension WeatherVC:CitySelectionDelegate {
    func citySelected(city: CityWeather) {
        self.vm.currentCity = city
        self.vm.updateForecast()
    }
}

extension WeatherVC:WeatherVMDelegate {
    func getWeatherData(weatherStrings:[String]) {
        guard let status = self.vm.currentCity?.currentWeather?.status else {return}
        self.assignBackground(status: status)
        
        DispatchQueue.main.async{
            self.formattedWeather = weatherStrings
            self.tableView.reloadData()
        }
    }
    
    func getcityName(name:String) {
        DispatchQueue.main.async{
            self.city = name
            self.navigationItem.title = name
            self.tableView.reloadData()
        }
    }
}
