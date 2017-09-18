//
//  ViewModel.swift
//  testDrivenExample
//
//  Created by Mac on 9/18/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

//This goes in model folder
protocol VMDelegate:class{
    func getAlert(alert:UIAlertController)
}

//The following goes here

class ViewModel{
    weak var viewController:VMDelegate?
    
    init(delegate:VMDelegate?) {
        self.viewController = delegate
    }
    
    //Logical Functions
    func multiply(x:Int, y:Int) -> Int{
        return x*y
    }
    
    //Model Functions

    
    //Updating view functions
    func setAlertWithResult(result:Int){
        let alert = UIAlertController(title: "k fine", message: "here yo numbahs: \(result)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "thnx b", style: .cancel)
        alert.addAction(ok)
        self.viewController?.getAlert(alert: alert)
    }
    
}
