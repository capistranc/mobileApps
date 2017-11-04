//
//  ViewController.swift
//  NotificationsAnimationsOther
//
//  Created by Mac on 9/29/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import MyChatFramework

class ViewController: UIViewController {
    @IBOutlet weak var scrollView:UIScrollView!
    @IBOutlet weak var textField:UITextField!
    @IBOutlet weak var sendButton:UIBarButtonItem!
    @IBOutlet weak var toolbarBottomConstraint:NSLayoutConstraint!
    
    var originalConstraintValue:CGFloat!
    var myNotGayRainbow:[UIColor] = [.red,.orange,.yellow, .green, .blue, .purple, .red,.orange,.yellow, .green, .blue, .purple]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        self.originalConstraintValue = toolbarBottomConstraint.constant
        
        //Add KVO
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {fatalError("wtf happened?")}
        appDelegate.addObserver(self, forKeyPath: "myVarToObserve", options: [.new,.old], context: nil)
        //Suscribe to notification
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyBoardWillDisappear(_:)), name: .UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyBoardWillAppear(_:)), name: .UIKeyboardWillShow, object: nil)
        
        setupScrollView()
    }
    
    func setupScrollView(){
        var y:CGFloat = 0
        for i in 0..<myNotGayRainbow.count{
            
            let view = UIView(frame:CGRect(x: 0, y: y, width: self.view.frame.width, height: 85))
            view.backgroundColor = myNotGayRainbow[i]
            y += 87
            self.scrollView.addSubview(view)
            let cell = CellContentView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 70))
            cell.bubbleType = i % 2 == 0 ? .user : .recipient
            cell.backgroundColor = .clear
            
            view.addSubview(cell)
        }
        
        scrollView.contentSize = CGSize(width: 0.0, height: y)
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
    @objc func keyBoardWillDisappear(_ sender:AnyObject) {
//        print("keyboard will disappear :-o")
        guard let notification = sender as? NSNotification else {return print("where noti @")}
        guard let info = notification.userInfo else {return}
        guard let duration = (info[UIKeyboardAnimationDurationUserInfoKey] as? NSValue) as? Double else {return print("bad duration val")}
        guard let keyboardFrame = (info[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return print("bad keyboard frame")}

        animateThis(to: -keyboardFrame.size.height, duration: duration)
    }
    
    @objc func keyBoardWillAppear(_ sender:AnyObject){
//        print("keyboard will appear!! :")
        guard let notification = sender as? NSNotification else {return print("where noti @")}
        guard let info = notification.userInfo else {return}
        guard let duration = (info[UIKeyboardAnimationDurationUserInfoKey] as? NSValue) as? Double else {return print("bad duration val")}
        guard let keyboardFrame = (info[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return print("bad keyboard frame")}

        animateThis(to: keyboardFrame.size.height, duration: duration)
    }
    
    func animateThis(to height:CGFloat, duration: Double){
        UIView.animate(withDuration: duration) {
            self.toolbarBottomConstraint.constant = height > 0 ? -height : 0

            self.view.layoutIfNeeded()
            let offset = CGPoint(x: 0.0, y: self.scrollView.contentOffset.y + height)
            self.scrollView.setContentOffset(offset, animated: false)
            
            print("final content offset: ", self.scrollView.contentOffset.y)
        }
    }
    
}

//typealias TableViewFunctions = ViewController
//extension TableViewFunctions:UITableViewDelegate, UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 12
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 85.0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {fatalError("where my cells at")}
//        cell.backgroundColor = myNotGayRainbow[indexPath.row]
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        textField.resignFirstResponder()
//        self.tableView.deselectRow(at: indexPath, animated: true)
//    }
//
//}

typealias TextViewFunctions = ViewController
extension TextViewFunctions:UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //        self.toolbarBottomConstraint = 0
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
