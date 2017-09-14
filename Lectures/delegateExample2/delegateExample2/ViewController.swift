//
//  ViewController.swift
//  delegateExample2
//
//  Created by Mac on 9/7/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

protocol TextWriterDelegate: class {
    func gotTextFromVC(text: String)
}

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    var myText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myLabel.text = self.myText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTextClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toSecondView", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mySegue = segue.destination as? ViewController else {return}
        
        
    }


}

