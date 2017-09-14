//
//  ViewController.swift
//  NetworkingWithClosures
//
//  Created by Mac on 9/13/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var characters:[SWCharacter] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        for i in  1..<86 {
            Networking.callApi(url: "https://swapi.co/api/people/\(i)") { [unowned self] (characters, error) in
                self.characters = characters!
            }
        }
    }
    
    func getCalledAfterNetwork() {
        print("network is done with one call")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

