//
//  ViewController.swift
//  Hw1 Counters
//
//  Created by Mac on 8/29/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel:UILabel! // These are implicitly unwrapped optionals
    @IBOutlet weak var label1:UILabel!
    @IBOutlet weak var label2:UILabel!
    @IBOutlet weak var label3:UILabel!
    @IBOutlet weak var btn1:UIButton!
    @IBOutlet weak var btn2:UIButton!
    @IBOutlet weak var btn3:UIButton!
    @IBOutlet weak var btn4:UIButton!
    @IBOutlet weak var btn5:UIButton!
    @IBOutlet weak var btn6:UIButton!
    //    btn1.tag = 1
    //    btn2.tag = 5
    //    btn3.tag = 10
    
    var count1 = 0, count2 = 0, count3 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "Whats up people"
        label1.text = "0"
        label2.text = "0"
        label3.text = "0"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateMyLabel(label:UILabel,  to text:String){
        label.text = text
    }
    
    @IBAction func buttonClicked(_ sender: AnyObject){
        switch sender {
        case let btn as UIButton where btn === btn1:
            count1 += 1
            updateMyLabel(label: label1, to: String(count1))
        case let btn as UIButton where btn === btn2:
            count2 += 5
            updateMyLabel(label: label2, to: String(count2))
        case let btn as UIButton where btn === btn3:
            count3 += 10
            updateMyLabel(label: label3, to: String(count3))
        case let btn as UIButton where btn === btn4:
            if count1 > 0 {
                count1 -= 1
                updateMyLabel(label: label1, to: String(count1))
            }
        case let btn as UIButton where btn === btn5:
            if count2 > 0 {
                count2 -= 5
                updateMyLabel(label: label2, to: String(count2))
            }
        case let btn as UIButton where btn === btn6:
            if count3 > 0 {
                count3 -= 10
                updateMyLabel(label: label3, to: String(count3))
            }
        default:
            break
        }
    }
    
    @IBAction func changeTitle(_ sender: AnyObject){
        textLabel.text = "I GOT CLICKED"
    }
    
    //    @IBAction func incrementByOneClick(_ sender: AnyObject) {
    //        count1 += 1
    //        label1.text = String(count1)
    //    }
    //
    //    @IBAction func decrementByOneClick(_ sender: AnyObject) {
    //        if count1 > 0 {count1 -= 1}
    //        label1.text = String(count1)
    //    }
    //
    //    @IBAction func incrementByFiveClick(_ sender: AnyObject) {
    //        count2 += 5
    //        label2.text = String(count2)
    //    }
    //    @IBAction func decrementByFiveClick(_ sender: AnyObject) {
    //        if count2 > 0 {count2-=5}
    //
    //        label2.text = String(count2)
    //    }
    //
    //    @IBAction func incrementByTenClick(_ sender: AnyObject) {
    //        count3 += 10
    //        label3.text = String(count3)
    //    }
    //    @IBAction func decrementByTenClick(_ sender: AnyObject) {
    //        if count3 > 0 { count3 -= 10 }
    //        label3.text = String(count3)
    //    }
    
}

