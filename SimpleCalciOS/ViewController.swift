//
//  ViewController.swift
//  SimpleCalciOS
//
//  Created by Austin Brovick  on 10/23/17.
//  Copyright © 2017 Austin Brovick . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    var status = true
    var current = "0"
    var op = 0
    var numbers: [Int] = []
    
    @IBAction func numberClicked(_ sender: UIButton) {
        if (status) {
            current = String(sender.tag)
            status = false
        } else {
            current = current + String(sender.tag)
        }
        label.text = current
    }
    
    @IBAction func basicOperation(_ sender: UIButton) {
        if (!status) {
            op = sender.tag
            numbers.append(Int(current)!)
            current = "0"
            status = true
        }
        print(sender.tag)
    }
    
    @IBAction func equalsButtonPressed(_ sender: UIButton) {
        numbers.append(Int(current)!)
        if (isAvg) {
            sum = sum + Int(current)!
            count = count + 1
            current = String(sum / count)
        } else {
            switch op {
            case 100:
                current = String(numbers[0] + numbers[1])
            case 101:
                current = String(numbers[0] - numbers[1])
            case 102:
                current = String(numbers[0] * numbers[1])
            case 103:
                current = String(numbers[0] / numbers[1])
            default:
                current = "0"
                status = false
                op = 0
            }
        }
        label.text = current
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        current = "0"
        status = true
        op = 0
        numbers = []
        sum = 0
        count = 0
        isAvg = false
        label.text = current
    }
    
    var sum = 0
    var count = 0
    var isAvg = false
    
    @IBAction func avgButtonPressed(_ sender: UIButton) {
        isAvg = true
        status = true
        sum = sum + Int(current)!
        count = count + 1
        current = "0"
        print(sum)
    }
    
    @IBAction func countButtonPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func factButtonPressed(_ sender: UIButton) {
        var answer = 1
        for x in 1...Int(current)! {
            answer = answer * x
        }
        label.text = String(answer)
        current = "0"
        op = 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "0"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

