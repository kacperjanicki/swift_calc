//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func ac_clear(_ sender: UIButton) {
        value.text=""
        current_num=""
    }
    
    @IBOutlet weak var value: UILabel!
    var current_num = ""
    @IBAction func operators(_ sender: UIButton) {
        if (sender.currentTitle == "√") {
            let editedText = current_num.replacingOccurrences(of: "√", with: "")
            print(type(of:editedText))
            let editedText2 = Int(editedText) ?? 0
            value.text=String(sqrt(Double(editedText2)))
        }
        else {
            current_num += sender.currentTitle!
            print(current_num)
            value.text!+=sender.currentTitle!
        }
    }

    @IBAction func num(_ sender: UIButton) {
        value.text!+=sender.currentTitle!
        current_num += sender.currentTitle!
        print(current_num)
        
    }
    
    @IBAction func equal(_ sender: UIButton) {
        if (current_num.contains("×")) {
            let new = current_num.components(separatedBy: "×")
            current_num = String(Int(new[0])! * (Int(new[1]) ?? 0))
            value.text = "\(current_num)"
        }
        if (current_num.contains("^")) {
            let new = current_num.components(separatedBy: "^")
            var a = Double(Int(new[0])!)
            var b = Double(Int(new[1])!)
            print(a,b)
            var new_value = pow(a,b)
            value.text=String(new_value)
            
//            value.text = String(pow(Double(a),Double(b)))
        }
        else {
            let expression = NSExpression(format:"\(current_num)")
            let new_value = expression.expressionValue(with: nil, context: nil) as! Int
            value.text="\(new_value)"
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

