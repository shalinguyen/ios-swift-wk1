//
//  SettingsViewController.swift
//  tip-calculator
//
//  Created by Shali Nguyen on 9/7/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tipTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("tipDefaultIndex")
    
        tipTable.dataSource = self
        tipTable.delegate = self
        tipTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDoneBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell") as UITableViewCell
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("tipDefaultIndex")
        
        
        if intValue == indexPath.row {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        var arrayOfTips = [10, 15, 20]
        cell.textLabel?.text = "\(arrayOfTips[indexPath.row])%"
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(indexPath.row, forKey: "tipDefaultIndex")
   
        tipTable.reloadData()
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
