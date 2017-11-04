//
//  ViewController.swift
//  testProject
//
//  Created by Mac on 9/28/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
//import ChatFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let cell = CellContentView(frame: CGRect(xL 0, y: 0, width: 0, height: 0))
        
        let matrix = Array2D<Int>(cols:10, rows: 10, defaultValue: 10)
        matrix[5,5] = 999
        print(matrix[5,5])
//        print(matrix.description)
        print(matrix)
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

