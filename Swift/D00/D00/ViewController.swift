//
//  ViewController.swift
//  D00
//
//  Created by Sivanesan jegathas on 11/01/2018.
//  Copyright © 2018 Sivanesan jegathas. All rights reserved.
//

import UIKit

enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Equal = "="
    case NULL = "Null"
    case ERROR = "Error"
}

class ViewController: UIViewController {

    @IBOutlet weak var screenLabel: UILabel!
    var number = ""
    var leftNumber = ""
    var rightNumber = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        screenLabel.text = "0"
    }
    
    @IBAction func numberBtn(_ sender: UIButton) {
        let text = sender.currentTitle!
        print(text)
        if (text == "0") {
            if (screenLabel.text != "0") {
                number += "\(text)"
                screenLabel.text = number
            }
        } else {
            number += "\(text)"
            screenLabel.text = number
        }
    }
    
    // btn AC clear screenLabel
    @IBAction func ACBtn(_ sender: UIButton) {
        number = ""
        leftNumber = ""
        rightNumber = ""
        currentOperation = .NULL
        screenLabel.text = "0"
    }
    
    func clearNoPrint() {
        number = ""
        leftNumber = ""
        rightNumber = ""
        currentOperation = .NULL
    }
    
    func CalculateBtn(operation: Operation) {
        if (number != "") {
            rightNumber = (leftNumber != "") ? number : ""
            leftNumber = (leftNumber == "") ? number : leftNumber
            number = ""
            currentOperation = (currentOperation == .NULL) ? operation : currentOperation
            print("Operation : \(leftNumber) \(currentOperation) \(rightNumber)")
            if (rightNumber != "") {
                if currentOperation == .Add {
                    leftNumber = "\(Int(leftNumber)!.addingReportingOverflow(Int(rightNumber)!).partialValue)"
                } else if currentOperation == .Subtract {
                    leftNumber = "\(Int(leftNumber)!.subtractingReportingOverflow(Int(rightNumber)!).partialValue)"
                } else if currentOperation == .Multiply {
                    leftNumber = (rightNumber == "0") ? "Erreur" : "\(Int(leftNumber)!.multipliedReportingOverflow(by: Int(rightNumber)!).partialValue)"
                } else if currentOperation == .Divide {
                    leftNumber = (rightNumber == "0") ? "Erreur" : "\(Int(leftNumber)!.dividedReportingOverflow(by: Int(rightNumber)!).partialValue)"
                }
                currentOperation = operation
                screenLabel.text = leftNumber
                print("Result :  \(leftNumber)")
                if leftNumber == "Erreur" || operation == .Equal {
                    clearNoPrint()
                }
            }
        }
    }
    
    @IBAction func negativeBtn(_ sender: UIButton) {
        if (number.count > 0) {
            let index = number.index(number.startIndex, offsetBy: 0)
            if (number[index] != "-") {
                if (number.count > 1 || number != "0") {
                    number = "-" + "\(number)"
                }
                screenLabel.text = number
                print("Number converted to negativ")
            }
        }
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func subtractBtn(_ sender: UIButton) {
        print("Soustraction")
        CalculateBtn(operation: .Subtract)
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
        print("Addition")
        CalculateBtn(operation: .Add)
    }
    
    @IBAction func multiplyBtn(_ sender: UIButton) {
        print("Multiplication")
        CalculateBtn(operation: .Multiply)
    }
    
    @IBAction func divideBtn(_ sender: UIButton) {
        print("Division")
        CalculateBtn(operation: .Divide)
    }
    
    @IBAction func equalBtn(_ sender: UIButton) {
        print("Résultat")
        CalculateBtn(operation: .Equal)
    }

}

