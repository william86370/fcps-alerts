//
//  settings.swift
//  
//
//  Created by Admin on 11/16/16.
//
//

import UIKit

class settings: UITableViewController {
    //start declaration
    @IBOutlet weak var photos: UISwitch!
    //open switch
    @IBOutlet weak var openswitch: UISwitch!
    //delayed switch
    @IBOutlet weak var delayedswitch: UISwitch!
    //earlydepartureswitch
    @IBOutlet weak var departureswitch: UISwitch!
    //closed switch
    @IBOutlet weak var clsoedswitch: UISwitch!
    //othermsgsitch
    @IBOutlet weak var otherswitch: UISwitch!
    //end declaration
    
    
   
    let defaults = UserDefaults.standard
    
    //start methods
    @IBAction func opench(_ sender: UISwitch) {
        //check the state of the button
        if(sender.isOn == true){
            //saves if on
            defaults.setValue(true, forKey: "opench")
        }else{
            //saves if off
            defaults.setValue(false, forKey: "opench")
        }
            }
    @IBAction func delayedch(_ sender: UISwitch) {
        //check the state of the button
        if(sender.isOn == true){
            //saves if on
            defaults.setValue(true, forKey: "delayedch")
        }else{
            //saves if off
            defaults.setValue(false, forKey: "delayedch")
        }
    }
    @IBAction func earlydeparturech(_ sender: UISwitch) {
        //check the state of the button
        if(sender.isOn == true){
            //saves if on
            defaults.setValue(true, forKey: "earlych")
        }else{
            //saves if off
            defaults.setValue(false, forKey: "earlych")
        }
    }
    @IBAction func closedch(_ sender: UISwitch) {
        //check the state of the button
        if(sender.isOn == true){
            //saves if on
            defaults.setValue(true, forKey: "closedch")
        }else{
            //saves if off
            defaults.setValue(false, forKey: "closedch")
        }
    }
    @IBAction func othermessagech(_ sender: UISwitch) {
        //check the state of the button
        if(sender.isOn == true){
            //saves if on
            defaults.setValue(true, forKey: "otherch")
        }else{
            //saves if off
            defaults.setValue(false, forKey: "otherch")
        }
    }
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        //check if its nil
        if(defaults.bool(forKey: "opench") != nil ){
            //if its not nil check for true or false values
            if(defaults.bool(forKey: "opench") == true){
                openswitch.setOn(true, animated: false)
            }else{
                 openswitch.setOn(false, animated: false)
            }
        }
        if(defaults.bool(forKey: "delayedch") != nil ){
            if(defaults.bool(forKey: "delayedch") == true){
                delayedswitch.setOn(true, animated: false)
            }else{
                delayedswitch.setOn(false, animated: false)
            }
        }
        if(defaults.bool(forKey: "earlych") != nil ){
            if(defaults.bool(forKey: "earlych") == true){
                departureswitch.setOn(true, animated: false)
            }else{
               departureswitch.setOn(false, animated: false)
            }
        }
        if(defaults.bool(forKey: "closedch") != nil ){
            if(defaults.bool(forKey: "closedch") == true){
                clsoedswitch.setOn(true, animated: false)
            }else{
                clsoedswitch.setOn(false, animated: false)
            }
        }
        if(defaults.bool(forKey: "otherch") != nil ){
            if(defaults.bool(forKey: "otherch") == true){
                otherswitch.setOn(true, animated: false)
            }else{
               otherswitch.setOn(false, animated: false)
            }
        }
        //end of loading in the buttons
   
        //depeds on wether or not to hide the navagation bar
       self.navigationController?.isNavigationBarHidden = false
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    @IBAction func photos(_ sender: Any) {
        if(photos.isOn == false){
            
            
        }else{
            SwiftSpinner.show("Downloading Backrounds")
            
            SwiftSpinner.show(progress: 1, title: "Downloading 5 of 5")
            SwiftSpinner.hide()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    

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
