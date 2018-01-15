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
            if (number.count > 1) {
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
    
    func CalculateBtn(operation: Operation) {
        print("caluculate start")
        if (number != "") {
            print("number different of null")
            rightNumber = (leftNumber != "") ? number : ""
            leftNumber = (leftNumber == "") ? number : leftNumber
            number = ""
            currentOperation = (currentOperation == .NULL) ? operation : currentOperation
            if (rightNumber != "") {
                print("in operation")
                if currentOperation == .Add {
                    leftNumber = "\(Int(leftNumber)! + Int(rightNumber)!)"
                } else if currentOperation == .Subtract {
                    leftNumber = "\(Int(leftNumber)! - Int(rightNumber)!)"
                } else if currentOperation == .Multiply {
                    leftNumber = "\(Int(leftNumber)! * Int(rightNumber)!)"
                } else if currentOperation == .Divide {
                    leftNumber = "\(Int(leftNumber)! / Int(rightNumber)!)"
                }
                currentOperation = operation
                screenLabel.text = leftNumber
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
        CalculateBtn(operation: .Subtract)
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
        CalculateBtn(operation: .Add)
    }
    
    @IBAction func multiplyBtn(_ sender: UIButton) {
        CalculateBtn(operation: .Multiply)
    }
    
    @IBAction func divideBtn(_ sender: UIButton) {
        CalculateBtn(operation: .Divide)
    }
    
    @IBAction func equalBtn(_ sender: UIButton) {
        CalculateBtn(operation: .Equal)
    }

}

