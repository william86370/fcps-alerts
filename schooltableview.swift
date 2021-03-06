//
//  schooltableview.swift
//  FCPS Alert
//
//  Created by William Wright on 9/3/16.
//  Copyright © 2016 A.R.C software and enginering. All rights reserved.
//

import UIKit

class schooltableview: UITableViewController {
    

    @IBOutlet weak var countynametxt: UILabel!
    
    @IBOutlet weak var menubtn: UIButton!
    
    @IBOutlet weak var loadingactivity: UIActivityIndicatorView!
    
    @IBOutlet weak var ststuscircleimg: UIImageView!
    
    @IBOutlet weak var ststustxt: UILabel!
    
    @IBOutlet weak var datetxt: UILabel!
    
    @IBOutlet weak var backroundphoto: UIImageView!
    
    let currentDate = NSDate()
    
    let date = NSDate()
    
    
    
    //get todays date
    let todaydate : NSDate = NSDate()
    let dateFormatter = DateFormatter()
    
    //declare twodiffrent date values for both date requirments
    let dayTimePeriodFormatter = DateFormatter()
    let calendar = NSCalendar.current
    
    
    
    override func viewDidLoad() {
        //set backround based on hour
        dayTimePeriodFormatter.dateFormat = "H"
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        print(dateString)
        let dateint = Int(dateString)
        if (dateint! >= 0 && dateint! <= 8){
     backroundphoto.image=UIImage(named: "snowbackround3.jpg")
        }
        if (dateint! >= 20 && dateint! <= 24){
            backroundphoto.image=UIImage(named: "snowbackround3.jpg")
        }
        //end backround change
        
        
        //code to change the date lable to the current date
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        datetxt.text = (dateFormatter.string(from: todaydate as Date))
        //end
        
       //set status bar
        //right now this disbales the status bar for this page
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController?.isNavigationBarHidden = true
        
        
        
        //load firebase info from firebase class
        firebase()
        
        
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func firebase(){
        //connect to firbase and pull down closeing info
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let status = value?["status"] as? String ?? ""
            //print the status to concel for logging
            //print(status) works
            
            //code to chek if the school is open based on fairebase varable
            if(status.contains("open")){
                self.ststustxt.text = "FCPS Schools Are Open"
                self.loadingactivity.stopAnimating()
                self.loadingactivity.hidesWhenStopped = true
                self.ststuscircleimg.image = UIImage(named:"open circle.png")
            }
            //code for closeings
            if(status.contains("closed")){
                self.ststustxt.text = "FCPS Schools Are Closed"
                self.loadingactivity.stopAnimating()
                self.loadingactivity.hidesWhenStopped = true
                self.ststuscircleimg.image = UIImage(named:"closedcircle.png")
            }
            //code for delayed
            if(status.contains("delayed")){
                self.ststustxt.text = "FCPS Schools Are Open 2 Hours Late"
                self.loadingactivity.stopAnimating()
                self.loadingactivity.hidesWhenStopped = true
                self.ststuscircleimg.image = UIImage(named:"delayovel.png")
            }
            //code incase of firebase error in my server side
            if(status.contains("error")){
                self.ststustxt.text = "FCPS Alerts is haveing issues connecting to the server "
                self.loadingactivity.stopAnimating()
                SwiftSpinner.show("Reconecting to FCPS Server").addTapHandler({
                    
                    SwiftSpinner.hide()
                }, subtitle: "Tap to hide while connecting! This will affect only the current operation.")
            }
        }) { (error) in
            //print the error to log
            print(error.localizedDescription)
        }
//end firebase method
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //becuase we are useing a table view this must be one
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //becuase we are useing a table view this must be one
        return 1
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
