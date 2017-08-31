//
//  ViewController.swift
//  test2
//
//  Created by Mac on 8/29/17.
//  Copyright © 2017 Mac. All rights reserved.
import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var label:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Hello World!!!"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClicked(_ sender: AnyObject){
        label.text = "Clicked Button"
    }
    
}

//Homework 2
//3 labels
//6 buttons
//1 label has inc and dec by 1
//2nd label inc and deec by 5
//3rd label inc and dec by 10
//Cannot go below 5
//Cannot go above 5
