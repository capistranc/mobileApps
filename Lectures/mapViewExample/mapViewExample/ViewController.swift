//
//  ViewController.swift
//  mapViewExample
//
//  Created by Mac on 9/21/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let defaultRadius:CLLocationDistance = 500
    var locationManager:CLLocationManager?
    var first = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        let centerOfUs = CLLocationCoordinate2D(latitude: CLLocationDegrees(39.8283), longitude: CLLocationDegrees(-98.5795))
        self.centerInLocation(location: centerOfUs)
        
        let delegate = UIApplication.shared.delegate as! AppDelegate //Must have an app delegate
        self.locationManager = delegate.locationManager
        locationManager?.delegate = self
        
        mapView.showsBuildings = true
        mapView.showsCompass = true
        mapView.showsTraffic = true
        mapView.showsPointsOfInterest = true
        mapView.mapType = .hybrid
        mapView.showsUserLocation = true
        locationManager?.activityType = .automotiveNavigation
        locationManager?.desiredAccuracy = kCLLocationAccuracyKilometer
        
        GlobalFunctions.delay(seconds: 5.0) {[unowned self] in
            self.locationManager?.startUpdatingLocation()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController:MKMapViewDelegate, CLLocationManagerDelegate{
    
    func centerInLocation(location: CLLocationCoordinate2D) {
        let region = MKCoordinateRegionMakeWithDistance(location, defaultRadius, defaultRadius)
        DispatchQueue.main.async {
            self.mapView.setRegion(region, animated: true)
            guard self.first else {return}
            print("DO WE GET HERE?")
            self.mapView.addAnnotation(MyPin(coordinate: location, title: "Here!", subtitle: "I was..."))
            self.first = false
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last ?? "WHERE U AT?")
        print("IM HERE: \(locations.last!.coordinate)")
        self.centerInLocation(location: locations.last!.coordinate)
    }
    
    func startUpdates(){
        GlobalFunctions.delay(seconds: 5){
        self.locationManager?.startUpdatingLocation()
            self.first = false
        }
    }
    
    func stopUpdates(){
        GlobalFunctions.delay(seconds: 5){
        self.locationManager?.stopUpdatingLocation()
            self.first = true
        }
    }
}

