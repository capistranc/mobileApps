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

class ViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let userPrefs = UserDefaults.standard
        guard let userName = userPrefs.value(forKey: Constants.kUserNameKey) as? String else {return}
        usernameField.text = userName
        var error:NSError?
        let localAuthContext = LAContext()
        
        guard localAuthContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error:&error) else {return}
        guard let pass = KeychainWrapper.standard.string(forKey:Constants.kUserKCKey(userName: userName)) else {return}
        
        localAuthContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Without fingerprrint people can see ur shit") {(success, error) in
            if success {
                print("we did it")
            }else {
                self.sendAlert(message: "im not cheeating", title: "of course im not")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender:AnyObject) {
        guard let userName = usernameField.text else {return}
        guard let pw = passwordField.text else {return}
        guard userName == "email@email.com" else {return self.sendAlert(message: "U dun goofed with the name", title:"Error")}
        guard pw == "myOriginalPassword" else {return self.sendAlert(message: "das a bad pw mang", title: "Error")}
        
        successfulLogin(email: userName)
    }
    func successfulLogin(email:String) {
        let userPrefs = UserDefaults.standard
        guard let userName = userPrefs.value(forKey: Constants.kUserNameKey) as? String else {return}
        userPrefs.set(email, forKey: Constants.kUserNameKey)
        
        let localAuthContext = LAContext()
        var error:NSError?
        guard localAuthContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {return}
        sendAlert(message: "Touch ID", title: "Do you wwant to keep hiding"){
            let keyChain = KeychainWrapper(serviceName: email)
        }
//        LAContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthentication)
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

