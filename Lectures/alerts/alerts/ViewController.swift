//
//  ViewController.swift
//  alerts
//
//  Created by Mac on 8/30/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    enum operations:{
//        case "+",
//        case "-",
//        case "*",
//        case "/",
//    }
    
    @IBOutlet weak var myLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let text = myLabel.text else {return}
        switch text.characters.count {
        case 0...10:
            myLabel.font = .systemFont(ofSize: 17)
        case 11...20:
            myLabel.font = .systemFont(ofSize: 16)
        case 21...30:
            myLabel.font = .systemFont(ofSize: 15)
        default:
            myLabel.font = .systemFont(ofSize: 12)
            myLabel.textColor = .blue
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func presentAlert(_ sender:AnyObject){
        let alert = UIAlertController(title: "Error", message: "If you keep asking questions, your homework is just going to keep getting harder \n Got it?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
}

