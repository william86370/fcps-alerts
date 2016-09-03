//
//  settingsTableViewController.swift
//  FCPS Alert
//
//  Created by william wright  on 12/13/15.
//  Copyright © 2015 A.R.C software and enginering. All rights reserved.
//

import UIKit


class settingsTableViewController: UITableViewController {
    
    
    @IBOutlet weak var open: UISwitch!
    
    @IBOutlet weak var delayedarival: UISwitch!
    
    @IBOutlet weak var earlydeparture: UISwitch!
    
    @IBOutlet weak var closed: UISwitch!
    
    @IBOutlet weak var other: UISwitch!
    
    
    @IBOutlet weak var nightlyopen: UISwitch!
    
    
    @IBOutlet weak var savebtn: UIBarButtonItem!
    
    
    
    let defaults = UserDefaults.standard
    
    
    @IBAction func open(_ sender: AnyObject) {
        savebtn.isEnabled = true
        
    }
    
    
    @IBAction func delayed(_ sender: AnyObject) {
        savebtn.isEnabled = true
        
    }
    
    
    
    @IBAction func early(_ sender: AnyObject) {
        savebtn.isEnabled = true
        
    }
    
    
    @IBAction func closed(_ sender: AnyObject) {
        savebtn.isEnabled = true
        
    }
    
    
    
    @IBAction func other(_ sender: AnyObject) {
        savebtn.isEnabled = true
        
    }
    
    
    
    
    
    
    
    @IBAction func selectmenu(_ sender: AnyObject) {
        
        toggleSideMenuView()
        
    }
    
    
    
    
    @IBAction func save(_ sender: AnyObject) {
        var toadd = [""]
        var toremove = [""]
        let currentInstallation = PFInstallation.current()
        let defaults = UserDefaults.standard
        var list = PFInstallation.current().channels
        if list == nil{
            list = [""]
        }
        
        if(open.isOn){
            defaults.set("on", forKey: "open")
            
        }else{
            
            defaults.set("off", forKey: "open")
            
        }
        //next
        if(delayedarival.isOn){
            defaults.set("on", forKey: "delayedariva")
            
        }else{
            
            defaults.set("off", forKey: "delayedariva")
            
        }
        //next
        if(earlydeparture.isOn){
            defaults.set("on", forKey: "earlydeparture")
            
        }else{
            defaults.set("off", forKey: "earlydeparture")
            
        }
        //next
        if(closed.isOn){
            defaults.set("on", forKey: "closed")
            
        }else{
            defaults.set("off", forKey: "closed")
            
        }
        //next
        if(other.isOn){
            
            
            
            defaults.set("on", forKey: "other")
            
        }else{
            defaults.set("off", forKey: "other")
            
        }
        
        
        
        print("saved all settings to mem")
        self.savebtn.isEnabled = false
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        
        navigationController?.navigationBar.barTintColor = UIColor.gray()
        navigationController?.navigationBar.tintColor = UIColor.white()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white()]

        
        
        let defaults = UserDefaults.standard
        
        if let opensw = defaults.string(forKey: "open")
        {
            if(opensw=="on"){
                self.open.setOn(true, animated:true)
            }
        }
        
        print(1)
        
        
        if let delayed7 = defaults.string(forKey: "delayedariva")
        {
            if(delayed7=="on"){
                self.delayedarival.setOn(true, animated:true)
            }
        }
        
        print(1)
        
        
        if let aerat = defaults.string(forKey: "earlydeparture")
        {
            if(aerat=="on"){
                self.earlydeparture.setOn(true, animated:true)
            }
        }
        print(1)
        
        
        
        if let closed3 = defaults.string(forKey: "closed")
        {
            if(closed3=="on"){
                self.closed.setOn(true, animated:true)
            }
        }
        
        print(1)
        
        
        if let other2 = defaults.string(forKey: "other")
        {
            if(other2=="on"){
                self.other.setOn(true, animated:true)
            }
        }
        
        
        
        
        self.navigationController!.navigationBar.isHidden = false
        
        
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
    
    // Configure the cell...
    
    return cell
    }
    */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
