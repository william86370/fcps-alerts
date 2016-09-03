//
//  MyMenuTableViewController.swift
//  SwiftSideMenu
//
//  Created by Evgeny Nazarov on 29.09.14.
//  Copyright (c) 2014 Evgeny Nazarov. All rights reserved.
//

import UIKit

class MyMenuTableViewController: UITableViewController {
    var selectedMenuItem : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize apperance of table view
        tableView.contentInset = UIEdgeInsetsMake(64.0, 0, 0, 0) //
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear()
        tableView.scrollsToTop = false
        
        // Preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        tableView.selectRow(at: IndexPath(row: selectedMenuItem, section: 0), animated: false, scrollPosition: .middle)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "CELL")
            cell!.backgroundColor = UIColor.clear()
            cell!.textLabel?.textColor = UIColor.darkGray()
            let selectedBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: cell!.frame.size.width, height: cell!.frame.size.height))
            selectedBackgroundView.backgroundColor = UIColor.gray().withAlphaComponent(0.2)
            cell!.selectedBackgroundView = selectedBackgroundView
        }
        
        if((indexPath as NSIndexPath).row==0){
            cell!.textLabel?.text = "Check FCPS"
        }
        if((indexPath as NSIndexPath).row==1){
             cell!.textLabel?.text = "Closeing's Arcive"
        }
        if((indexPath as NSIndexPath).row==2){
            cell!.textLabel?.text = "Settings"
        }
        if((indexPath as NSIndexPath).row==3){
            cell!.textLabel?.text = "Contact Us"
        }
        
        
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("did select row: \((indexPath as NSIndexPath).row)")
        
        if ((indexPath as NSIndexPath).row == selectedMenuItem) {
            return
        }
        
        selectedMenuItem = (indexPath as NSIndexPath).row
        
        //Present new view controller
        var mainStoryboard = UIStoryboard()
        var height = UIScreen.main().bounds.size.height
        
        if height == 568 {
            mainStoryboard = UIStoryboard(name: "iphone4", bundle: nil)
        }else if height == 736{
            
            mainStoryboard = UIStoryboard(name: "iphone6+", bundle: nil)
            
        }else {
            mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        }

        
        var destViewController : UIViewController
        switch ((indexPath as NSIndexPath).row) {
        case 0:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController1") 
            break
        case 1:
             destViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController2")
            break
        case 2:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController3")
            break
       
        default:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController4")
            break
        }
        sideMenuController()?.setContentViewController(destViewController)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
