//
//  ViewController.swift
//  NetworkingUnitTests
//
//  Created by Mac on 9/20/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import LocalAuthentication
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func registerClicked(_ sender:AnyObject) {
        if let email = usernameField.text, let password = passwordField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                guard error == nil else {
                    self.sendAlert(message: error!.localizedDescription, title: "Error!")
                    return print(error!.localizedDescription)}
                if let userEmail = user?.email {
                    self.sendAlert(message: userEmail, title: "Successfully created user")
                }
            }
        }
    }
    
    @IBAction func login(_ sender:AnyObject) {
        if let email = usernameField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                guard error == nil else {
                    self.sendAlert(message: error!.localizedDescription, title: "Error!")
                    return print(error!.localizedDescription)}
                if let userEmail = user?.email {
                    self.sendAlert(message: userEmail, title: "Successfully Logged In")
                }
            }
            
        }
    }
    
    func sendAlert(message:String, title:String, completion: (() -> ())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok  = UIAlertAction(title: "ok", style: .cancel){ alert in
            completion?()
        }
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
}

