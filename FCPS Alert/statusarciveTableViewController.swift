//
//  statusarciveTableViewController.swift
//  FCPS Alert
//
//  Created by william wright  on 12/17/15.
//  Copyright © 2015 A.R.C software and enginering. All rights reserved.
//

import UIKit


class statusarciveTableViewController: UITableViewController {
    
     var arcive = [String]()
    var dates = [String]()
    
    
    @IBAction func menuebtn(_ sender: AnyObject) {
         toggleSideMenuView()
        
    }
    
    
      
    
   

    override func viewDidLoad() {
        navigationController?.navigationBar.barTintColor = UIColor.gray
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

       
        let defaults = UserDefaults.standard
        
        
        if let ststusarray = defaults.stringArray(forKey: "statusarray")
        {
            self.arcive = ststusarray
        }
        if let datearray = defaults.stringArray(forKey: "datearray")
        {
            self.dates = datearray
        }
        
        
       
        /*let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            
            
            var query = PFQuery(className:"weather")
            query.getObjectInBackgroundWithId("Yp9VaaqsB8") {
                (gameScore: PFObject?, error: NSError?) -> Void in
                if error == nil && gameScore != nil {
                    print("i ran")
                    print(gameScore!["status"])
                    
                self.arcive = gameScore!["status"] as! [String]
                } else {
                    print(error)
                }
            }
            
            
            
            */

        
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

        return arcive.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! statusTableViewCell
        print("ran caell")
        if(arcive.isEmpty == false ){
            if(arcive[(indexPath as NSIndexPath).row]=="closed"){
                cell.cellimg.image = UIImage(named:"smallclosedcircle.png")
                cell.celldcs.text = "Closed-All Fairfax county Public Schools Are Closed For the Day"
                cell.celldate.text = dates[(indexPath as NSIndexPath).row]
            }
            if(arcive[(indexPath as NSIndexPath).row]=="open"){
                cell.cellimg.image = UIImage(named:"smallopencircle.png")
                cell.celldcs.text = "Open-All Fairfax county Public Schools Are Open"
                cell.celldate.text = dates[(indexPath as NSIndexPath).row]
            }
            if(arcive[(indexPath as NSIndexPath).row]=="delayed"){
                cell.cellimg.image = UIImage(named:"delayedsmallcircle.png")
                cell.celldcs.text = "2 Hr Delay-All Fairfax county Public Schools Are Starting 2 Hrs Late"
                cell.celldate.text = dates[(indexPath as NSIndexPath).row]
            }
        }else{
            
            
            return cell
        }
        
        
        
        
        
        
        

        // Configure the cell...

        return cell
    }
    
    
    func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        var indexpath : IndexPath = self.tableView.indexPathForSelectedRow!
        
        let Dest = segue.destination as! arciveviewTableViewController
        Dest.date = dates[indexpath.row]
        
        Dest.status = arcive[indexpath.row]
        
        
        
    }
    

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
