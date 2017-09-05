//
//  ViewController.swift
//  Calculator
//
//  Created by Mac on 8/30/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentLabel:UILabel!
    @IBOutlet weak var previewLabel:UILabel!
    
    @IBOutlet weak var oneBtn:NumberButton!
    @IBOutlet weak var twoBtn:NumberButton!
    @IBOutlet weak var threeBtn:NumberButton!
    @IBOutlet weak var fourBtn:NumberButton!
    @IBOutlet weak var fiveBtn:NumberButton!
    @IBOutlet weak var sixBtn:NumberButton!
    @IBOutlet weak var sevenBtn:NumberButton!
    @IBOutlet weak var eightBtn:NumberButton!
    @IBOutlet weak var nineBtn:NumberButton!
    @IBOutlet weak var zeroBtn:NumberButton!
    
    @IBOutlet weak var plusBtn:OperationButton!
    @IBOutlet weak var minusBtn:OperationButton!
    @IBOutlet weak var multiplyBtn:OperationButton!
    @IBOutlet weak var divideBtn:OperationButton!
    @IBOutlet weak var equalsBtn:OperationButton!
    @IBOutlet weak var clearBtn:OperationButton!
    @IBOutlet weak var negateBtn:OperationButton!
    @IBOutlet weak var decimalBtn:OperationButton!
//    @IBOutlet weak var undoBtn:OperationButton!
    
    var lhs:Double?
    var rhs:Double?
    var currentOp:Operation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oneBtn.setNumber(value: 1)
        twoBtn.setNumber(value: 2)
        threeBtn.setNumber(value: 3)
        fourBtn.setNumber(value: 4)
        fiveBtn.setNumber(value: 5)
        sixBtn.setNumber(value: 6)
        sevenBtn.setNumber(value: 7)
        eightBtn.setNumber(value: 8)
        nineBtn.setNumber(value: 9)
        zeroBtn.setNumber(value: 0)
        
        
        plusBtn.setOperation(to: .plus)
        minusBtn.setOperation(to: .minus)
        multiplyBtn.setOperation(to: .multiply)
        divideBtn.setOperation(to: .divide)
        equalsBtn.setOperation(to: .equals)
        clearBtn.setOperation(to: .clear)
        negateBtn.setOperation(to: .negate)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func presentAlert(){
        let alert = UIAlertController(title: "Error", message: "BRUH, U CANT DIVIDE BY 0. TF U TRYNA DO!?!?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Sorry, I'm a madman", style: .cancel)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    func overflowError(){
        let alert = UIAlertController(title: "Error", message: "Why can't I hold all these ints??", preferredStyle: .alert)
        let ok = UIAlertAction(title: "slow down buddy", style: .cancel)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    @IBAction func NumberPress(_ sender:Any) {
        guard let btn = sender as? NumberButton else {return}
        if currentOp == nil {
            let val = lhs ?? 0.0
            let strCheck = String(val)
            if strCheck.characters.count > 15 {return}
            lhs = val * 10 + btn.num
        } else {
            let val = rhs ?? 0.0
            let strCheck = String(val)
            if strCheck.characters.count > 15 {return}
            rhs = val * 10 + btn.num
        }
        
        updateLabels()
    }
    
    func clearValues(){
        lhs = nil
        rhs = nil
        currentOp = nil
        updateLabels()
    }
    
    func updateLabels() {
        var str:String = ""
        currentLabel.text = str
        previewLabel.text = str
        guard let leftVal = lhs else {return}
        str = String(leftVal)
        
        guard let opString = currentOp else {
            currentLabel.text = str
            return}
        str = str + opString.rawValue
        currentLabel.text = str
        
        guard let rightVal = rhs else {
            currentLabel.text = str
            return}
        str = str + String(rightVal)
        currentLabel.text = str
        
        guard let result = evaluateExpression() else {return}
        previewLabel.text = String(result)
        
    }
    
    func evaluateExpression() -> Double? {
        var answer = 0.0
        guard let leftVal = lhs else {return nil}
        guard let rightVal = rhs else {return nil}
        guard let op = currentOp else {return nil}
        
        switch op {
        case .plus:
            answer = leftVal + rightVal
        case .minus:
            answer = leftVal - rightVal
        case .multiply:
            answer = leftVal * rightVal
        case .divide:
            if rightVal == 0 {
                rhs = nil
                
                presentAlert()
                return nil
            }
            answer = leftVal / rightVal
        default:
            break
        }
        
        return answer
    }
    
    func evaluateEquals() {
        guard let answer = evaluateExpression() else {return updateLabels()}
        clearValues()
        lhs = answer
        updateLabels()
    }
    

    
    @IBAction func OperationPress(_ sender:Any) {
        guard let btn = sender as? OperationButton else {return}
        switch btn.operation {
//        case .undo:
//            if currentOp == nil{
//                guard let leftVal = lhs else {return}
//                lhs = leftVal / 10
//            } else {
//                guard let rightVal = rhs else {return}
//                rhs = rightVal / 10
//            }
            
        case .clear:
            clearValues()
        case .equals:
            evaluateEquals()
        case .negate:
            if currentOp == nil, let val = lhs{
                lhs = -val
            } else if let val = rhs{
                rhs = -val
            }
        default:
            if currentOp != nil {
                lhs = evaluateExpression() ?? lhs
                rhs = nil
            }
            currentOp = btn.operation
            break
        }
            updateLabels()
    }
}
