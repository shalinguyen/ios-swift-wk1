//
//  ViewController.swift
//  tip-calculator
//
//  Created by Shali Nguyen on 9/2/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipAmount.text = "$0.00"
        totalAmount.text = "$0.00"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view did appear")
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey("tipDefaultIndex")
        tipControl.selectedSegmentIndex = intValue
    }
    
    func updateValues() {
        
        var tipPercentages = [0.1, 0.15, 0.2]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var bill = NSString(string: billField.text).doubleValue
        
        var tip = bill * tipPercentage
        var total = bill + tip
    
        
        tipAmount.text = String(format: "$%.2f", tip)
        totalAmount.text = String(format: "$%.2f", total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        println("On tap")
        view.endEditing(true)
        updateValues()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        println("User editing bill")
        updateValues()
    }
    
    
}

