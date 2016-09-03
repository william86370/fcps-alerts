//
//  arciveviewTableViewController.swift
//  FCPS Alert
//
//  Created by william wright  on 12/23/15.
//  Copyright © 2015 A.R.C software and enginering. All rights reserved.
//

import UIKit

class arciveviewTableViewController: UITableViewController {
    var status = String()
    var date = String()
    
    @IBOutlet weak var statuscircle: UIImageView!
    
    @IBOutlet weak var statusdate: UILabel!
    
    @IBOutlet weak var currentstatus: UILabel!
    
    @IBOutlet weak var info1: UILabel!
    
    @IBOutlet weak var info2: UILabel!
    
    @IBOutlet weak var backround: UIImageView!
    
    func setopen(){
        statuscircle.isHidden=true
        backround.image = UIImage(named: "greenopenbackround.png")
        statuscircle.image = UIImage(named:"open circle.png")
        statuscircle.isHidden=false
        currentstatus.text = "Status: Open"
        info1.text = "1.)  All Fairfax County Public Schools are OPEN, Students and Teachers are required to attend school."
        info2.text = "2.) All After School Activatys are Still On For Today. If you want any more information on after school activitys please check out www.fcps.edu."
        
        
    }
    func setClosed(){
        statuscircle.isHidden=true
        backround.image = UIImage(named: "redclosedbackround.png")
        statuscircle.image = UIImage(named:"closedcircle.png")
        statuscircle.isHidden=false
        currentstatus.text = "Status: Closed"
        info1.text = "1.)  All Fairfax County Public Schools are Closed, Students and Teachers are not required to Report to school."
        info2.text = "2.)Some after school activatys may be cancelled due to bad weather. Go to www.fcps.edu for more information about after school activitys."
    }
    func setDleay(){
        statuscircle.isHidden=true
        backround.image = UIImage(named: "delaybackround.png")
        statuscircle.image = UIImage(named:"delayovel.png")
        statuscircle.isHidden=false
        currentstatus.text = "Status: 2 Hr Delay"
        info1.text = "1.)  All Fairfax County Public Schools are OPEN, Students and Teachers are required to attend school."
        info2.text = "2.)Some after school activatys may be cancelled due to bad weather. Go to www.fcps.edu for more information about after school activitys."
        
    }
        
    
    @IBAction func moreinfo(_ sender: AnyObject) {
        //code for fcps website
        UIApplication.shared().openURL(URL(string: "http://www.fcps.edu/news/weather.shtml")!)

    }

    override func viewDidLoad() {
        navigationController?.navigationBar.barTintColor = UIColor.gray()
        navigationController?.navigationBar.tintColor = UIColor.white()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white()]
        statusdate.text = date
        if (status == "open"){
            setopen()
        }else if (status == "closed"){
            
            setClosed()
            
        }else{
             setDleay()
            }
        
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

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
