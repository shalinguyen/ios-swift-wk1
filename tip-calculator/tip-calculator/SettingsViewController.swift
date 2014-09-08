//
//  SettingsViewController.swift
//  tip-calculator
//
//  Created by Shali Nguyen on 9/7/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSettingsControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("tipDefaultIndex")
        tipSettingsControl.selectedSegmentIndex = intValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipSettingsControl.selectedSegmentIndex, forKey: "tipDefaultIndex")
        defaults.synchronize()
    }
    
    @IBAction func onDoneBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
