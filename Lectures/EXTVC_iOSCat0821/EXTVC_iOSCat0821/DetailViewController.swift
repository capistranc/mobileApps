//
//  DetailViewController.swift
//  EXTVC_iOSCat0821
//
//  Created by Alfonso Tapia on 8/31/17.
//  Copyright © 2017 BB. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController:UIViewController{
    
    var selectedMovie:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Got to the detail with: \(selectedMovie ?? "Nothing")")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
