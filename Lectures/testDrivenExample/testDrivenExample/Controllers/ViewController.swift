//
//  ViewController.swift
//  testDrivenExample
//
//  Created by Mac on 9/18/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    @IBOutlet weak var numField1: UITextField!
//    @IBOutlet weak var numField2: UITextField!
    
    lazy var viewModel:ViewModel = ViewModel(delegate: self)
    @IBOutlet weak var numField1: UITextField!
    @IBOutlet weak var numField2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func multiplyClick(sender:AnyObject){
        guard let num1Text = numField1.text else {return }
        guard let num2Text = numField2.text else {return}
        guard let num1 = Int(num1Text) else {return}
        guard let num2 = Int(num2Text) else {return}

        let result = viewModel.multiply(x: num1, y: num2)
        viewModel.setAlertWithResult(result: result)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController:VMDelegate {
    func getAlert(alert: UIAlertController) {
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}

