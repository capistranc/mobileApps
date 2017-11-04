//
//  ViewController.swift
//  NotificationsAnimationsOther
//
//  Created by Mac on 9/29/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var textField:UITextField!
    @IBOutlet weak var sendButton:UIBarButtonItem!
    @IBOutlet weak var toolbarBottomConstraint:NSLayoutConstraint!
    
    var myNotGayRainbow:[UIColor] = [.red,.orange,.yellow, .green, .blue, .purple, .red,.orange,.yellow, .green, .blue, .purple]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
//        DispatchQueue.main.async {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {fatalError("wtf happened?")}
            appDelegate.addObserver(self, forKeyPath: "myVarToObserve", options: [.new,.old], context: nil)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let oldVal = change?[.oldKey] as? String else {return}
        guard let newVal = change?[.newKey] as? String else {return}
        print("Was: \(oldVal)")
        print("Now: \(newVal)")
        
    }
    
}

typealias TableViewFunctions = ViewController
extension TableViewFunctions:UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {fatalError("where my cells at")}
        cell.backgroundColor = myNotGayRainbow[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        textField.resignFirstResponder()
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

}

typealias TextViewFunctions = ViewController
extension TextViewFunctions:UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            guard string != "\n" else {
                textField.resignFirstResponder()
                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {fatalError("wtf happened?")}
                    appDelegate.myVarToObserve = text
                return false
            }
//            guard Int(text) == nil else {return false}
            return true
        }
        return false
    }

}
