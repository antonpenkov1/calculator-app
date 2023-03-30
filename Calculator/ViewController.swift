//
//  ViewController.swift
//  Calculator
//
//  Created by Антон Пеньков on 28.03.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    var workings: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearAll()
    }

    func clearAll() {
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    
    func addToWorkings(value: String) {
        workings += value
        calculatorWorkings.text = workings
    }
    
    func formatResult(result: Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings {
            if (specialCharater(char: char)) {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if (index == 0) {
                return false
            }
            if (index == (workings.count - 1)) {
                return false
            }
            if (previous != -1) {
                if (index - previous == 1) {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharater(char: Character) -> Bool {
        if (char == "*") {
            return true
        }
        if (char == "/") {
            return true
        }
        if (char == "-") {
            return true
        }
        if (char == "+") {
            return true
        }
        return false
    }
    
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    @IBAction func backTap(_ sender: Any) {
        if(!workings.isEmpty) {
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    @IBAction func percentTap(_ sender: Any) {
        addToWorkings(value: "%")
    }
    @IBAction func divideTap(_ sender: Any) {
        if calculatorResults.text != "" {
            addToWorkings(value: "\(calculatorResults.text!)/")
        } else {
            addToWorkings(value: "/")
        }
    }
    @IBAction func multiplyTap(_ sender: Any) {
        if calculatorResults.text != "" {
            addToWorkings(value: "\(calculatorResults.text!)*")
        } else {
            addToWorkings(value: "*")
        }
    }
    @IBAction func minusTap(_ sender: Any) {
        if calculatorResults.text != "" {
            addToWorkings(value: "\(calculatorResults.text!)-")
        } else {
            addToWorkings(value: "-")
        }
    }
    @IBAction func plusTap(_ sender: Any) {
        if calculatorResults.text != "" {
            addToWorkings(value: "\(calculatorResults.text!)+")
        } else {
            addToWorkings(value: "+")
        }
    }
    @IBAction func equalTap(_ sender: Any) {
        if validInput() {
            let checkWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
            workings = ""
        } else {
            let alert = UIAlertController(
                title: "InvalidInput",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
        
    }
    
    @IBAction func decimalTap(_ sender: Any) {
        addToWorkings(value: ".")
    }
    @IBAction func zeroTap(_ sender: Any) {
        addToWorkings(value: "0")
    }
    @IBAction func oneTap(_ sender: Any) {
        addToWorkings(value: "1")
    }
    @IBAction func twoTap(_ sender: Any) {
        addToWorkings(value: "2")
    }
    @IBAction func threeTap(_ sender: Any) {
        addToWorkings(value: "3")
    }
    @IBAction func fourTap(_ sender: Any) {
        addToWorkings(value: "4")
    }
    @IBAction func fiveTap(_ sender: Any) {
        addToWorkings(value: "5")
    }
    @IBAction func sixTap(_ sender: Any) {
        addToWorkings(value: "6")
    }
    @IBAction func sevenTap(_ sender: Any) {
        addToWorkings(value: "7")
    }
    @IBAction func eightTap(_ sender: Any) {
        addToWorkings(value: "8")
    }
    @IBAction func nineTap(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
    
    
    
    
    
}

