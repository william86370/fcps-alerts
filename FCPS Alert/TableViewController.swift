//
//  TableViewController.swift
//  FCPS Alert
//
//  Created by william wright  on 12/11/15.
//  Copyright © 2015 A.R.C software and enginering. All rights reserved.
//

import UIKit
import iAd
import Parse

class TableViewController: UITableViewController, ENSideMenuDelegate, ADBannerViewDelegate {
    @IBOutlet weak var datestring: UILabel!
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var opencircle: UIImageView!
    @IBOutlet weak var weatherinfo: UILabel!
    @IBOutlet weak var Status: UILabel!
    let ran = Int(arc4random_uniform(4))
    
    @IBOutlet weak var ststus2: UILabel!
    
    @IBOutlet weak var backround: UIImageView!
    @IBOutlet weak var statuscircle: UIImageView!
    var x = 0
    @IBOutlet weak var abouttext: UILabel!
    @IBOutlet weak var backroundimage: UIImageView!
    
    @IBOutlet weak var refreashview: UIActivityIndicatorView!
    
    var statusarray = [String]()
    
    
    func setNavBarTranslucent(){
        self.navigationController?.navigationBar.alpha = 0.1
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.isUserInteractionEnabled = false
    }
    
    
    func rotateView() {
        
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear, animations: { () -> Void in
            self.statuscircle.transform = self.statuscircle.transform.rotate(CGFloat(M_PI_2))
            }) { (finished) -> Void in
                self.rotateView()
        }
    }
    
    
    
    
    
    func setview() {
        downloadparsedata(){
            print("ran parse data")
            self.downloadwebsitedats(){(isResponse) -> Void in
                print("ran both data")
                 DispatchQueue.main.async {
                let defaults = UserDefaults.standard
                let name = defaults.string(forKey: "status")
                let status = name
                print(isResponse)
                    self.refreashview.stopAnimating()
                if(isResponse.range(of: "Open 2 hours late") != nil){
                    self.setdelayed()
                    print("set delayed")
                    
                    
                }
                else if(isResponse.range(of: "Closed") != nil){
                    self.setClosed()
                    print("set closed")
                    
                }else{
                    
                    
                    let date = Date()
                    let calendar = Calendar.current
                    let components = calendar.components([.day , .month , .year], from: date)
                    let year = components.year
                    let month = components.month
                    let day = components.day
                    if(month < 10){
                         let month: String  = "0" + String(month)
                    }
                    if(day < 10){
                        
                        let day: String = "0" + String(day)
                    }
                    
                    let day2 = String(year) + "-" + String(month) + "-" + String(day)
                    print(self.getDayOfWeek(day2))
                    
                    if ( self.getDayOfWeek(day2) == 7||self.getDayOfWeek(day2) == 8){
                         self.setweekend()
                    }else{
                    self.setopen()
                    print("set open")
                    }
                }
                }
            }

        }
        
    }
    func getDayOfWeek(_ today:String)->Int? {
        
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let todayDate = formatter.date(from: today) {
            let myCalendar = Calendar(calendarIdentifier: Calendar.Identifier.gregorian)!
            let myComponents = myCalendar.components(.weekday, from: todayDate)
            let weekDay = myComponents.weekday
            return weekDay
        } else {
            return nil
        }
    }
    func downloadparsedata(_ completion:()->()){
        
        let query = PFQuery(className:"weather")
        query.getObjectInBackground(withId: "Yp9VaaqsB8") {
            (gameScore: PFObject?, error: NSError?) -> Void in
            if error == nil && gameScore != nil {
                let defaults = UserDefaults.standard
                defaults.set(gameScore!["status"], forKey: "statusarray")
                defaults.set(gameScore!["dates"], forKey: "datearray")
                completion()
            } else {
                
                print(error)
                 let alertController = UIAlertController(title: "FCPS Alert's", message:
                   "Sorry We Failed to connect to the server, please check your network settings and refreash the page.", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                
            }
        }
        
        
        
        
    }
    func downloadarrayofsites(_ completionHandler : ((array : [String]) -> Void)) {
        let url = URL(string: "http://closings.victorlourng.com/dc/api/?data")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            let name3 = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as! String
            let myarray = name3.components(separatedBy: ",")
            completionHandler(array : myarray)
        
        }
        task.resume()
        
        
    }
    
    
    func downloadwebsitedats(_ completionHandler : ((isResponse : String) -> Void)) {
        
        print("it acualtty ran")
        let url = URL(string: "http://closings.victorlourng.com/dc/api/?data")
         let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
          DispatchQueue.main.async {
            let name3 = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as! String
            let myarray = name3.components(separatedBy: ",")
            for element in myarray {
                
                if((element.range(of: "Fairfax County Schools")) != nil){
                    let astring = element.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                    var newstring = astring.replacingOccurrences(of: "\n",   with: "")
                    newstring = newstring.replacingOccurrences(of: "\"", with: "")
                    newstring = newstring.replacingOccurrences(of: "item:Fairfax County Schools", with:"")
                    
                    print(newstring)
                    let defaults = UserDefaults.standard
                    defaults.set(newstring, forKey: "status")
                    
                    print("done")
                   
                    completionHandler(isResponse : newstring)
                    
                    
                    
                   
                
                    
                }
                print("run")
            }
            }
            print("no interneot or opwn?")
            let defaults = UserDefaults.standard
            //defaults.setObject("open", forKey: "status")
            completionHandler(isResponse : "open")
           
        }
        task.resume()
        
        
        
        
        
    }
    
    
    
    
    
    func getdata(_ completion:()->()){
        
        
        let query = PFQuery(className:"weather")
        query.getObjectInBackground(withId: "Yp9VaaqsB8") {
            (gameScore: PFObject?, error: NSError?) -> Void in
            if error == nil && gameScore != nil {
                let defaults = UserDefaults.standard
                defaults.set(gameScore!["status"], forKey: "statusarray")
                defaults.set(gameScore!["dates"], forKey: "datearray")
                
            } else {
                print(error)
                let alertController = UIAlertController(title: "FCPS Alert's", message:
                   "Sorry We Failed to connect to the server, please check your network settings and refreash the page.", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
        
        print("loaded data from parse")
        
        
        /* let url = NSURL(string: "http://closings.victorlourng.com/dc/api/?data")!
        
        
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
        
        if let urlContent = data {
        print(data)
        
        do {
        
        let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
        print(jsonResult)
        
        if let blogs = jsonResult as? [[String: AnyObject]] {
        print(blogs)
        
        for blog in blogs {
        
        if let name3 = blog["item"] as? String {
        
        if(name3.rangeOfString("Fairfax County Schools") != nil){
        let name2 = name3.stringByReplacingOccurrencesOfString("Fairfax County Schools", withString: "")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(name2, forKey: "status")
        print(name2)
        print("done")
         
        }
        }
        
        }
         
        }
        
        } catch {
        
        print("JSON serialization failed")
        // let alertController = UIAlertController(title: "FCPS Alert's", message:
        //   "Sorry We Failed to connect to the server, please check your network settings and refreash the page.", preferredStyle: UIAlertControllerStyle.Alert)
        //alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        
        //self.presentViewController(alertController, animated: true, completion: nil)
         
        
        }
        
        
        }
        
        
        }
        */
        
        // task.resume()
        
        let url = URL(string: "http://closings.victorlourng.com/dc/api/?data")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
       
            let name3 = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as! String
            let myarray = name3.components(separatedBy: ",")
            for element in myarray {
                if((element.range(of: "Fairfax County Schools")) != nil){
                    let astring = element.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                    var newstring = astring.replacingOccurrences(of: "\n",   with: "")
                    newstring = newstring.replacingOccurrences(of: "\"", with: "")
                    newstring = newstring.replacingOccurrences(of: "item:Fairfax County Schools", with: "")
                    
                    print(newstring)
                    let defaults = UserDefaults.standard
                    defaults.set(newstring, forKey: "status")
                    
                    print("done")
                    print("done for real")
                    
                    
                    
                    completion()
                    
                }
               
                                    }
                print("run")
            
            }
             task.resume()
             
            
            
            
            
            
            

                //print("JSON serialization failed")
                // let alertController = UIAlertController(title: "FCPS Alert's", message:"Sorry We Failed to connect to the server, please check your network settings and refreash the page.", preferredStyle: UIAlertControllerStyle.Alert)
                //alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                //self.presentViewController(alertController, animated: true, completion: nil)
            
            
           // let substring: String = name3[range!]
            //let defaults = NSUserDefaults.standardUserDefaults()
           // defaults.setObject(substring, forKey: "status")
            //print(substring)
           // print("done")
            
            
            
             
            }
        
            
            
            
            
            
            
            
            
            
        
    


   
    
    
    
    func setopen(){
        statuscircle.isHidden=true
        opencircle.image = UIImage(named:"open circle.png")
        opencircle.isHidden=false
        Status.text = "Status: Open"
        //abouttext.text = "1.)  All Fairfax County Public Schools are OPEN, Students and Teachers are required to attend school."
        //ststus2.text = "2.) All After School Activatys are Still On For Today. If you want any more information on after school Activities please check out www.fcps.edu."
        
        
    }
    
    
    func setClosed(){
        statuscircle.isHidden=true
        
        opencircle.image = UIImage(named:"closedcircle.png")
        opencircle.isHidden=false
        Status.text = "Status: Closed"
        //abouttext.text = "1.)  All Fairfax County Public Schools are Closed, Students and Teachers Have the day off. Enjoy your snow day."
        //ststus2.text = "2.)Some after school activatys may be cancelled due to bad weather. Go to www.fcps.edu for more information about after school Activities."
    }
    
    func setdelayed() {
        statuscircle.isHidden=true
        
        opencircle.image = UIImage(named:"delayovel.png")
        opencircle.isHidden=false
        Status.text = "Status: 2 Hr Delay"
       // abouttext.text = "1.)  All Fairfax County Public Schools are Delayed, School will start 2 hours after the given start time"
        //ststus2.text = "2.)Some after school activatys may be cancelled due to bad weather. Go to www.fcps.edu for more information about after school Activities."
        
    }
    func setweekend() {
        statuscircle.isHidden=true
        opencircle.image = UIImage(named:"weekend circle.png.png")
        opencircle.isHidden=false
        Status.text = "Status: Weekend"
       // abouttext.text = "1.)  All Fairfax County Public Schools are Closed, Its the weekend sleep in and chill"
        //ststus2.text = "2.)Some after school activatys may be cancelled due to bad weather. Go to www.fcps.edu for more information about after school Activities."
        
    }

    
    
    
    
    @IBAction func learnmore(_ sender: AnyObject) {
        UIApplication.shared().openURL(URL(string: "http://www.fcps.edu/news/weather.shtml")!)
    }
    
    
    
    
    
    func changepage(){
       
        self.getdata(){
            DispatchQueue.main.async {
                print("after receved")
                let defaults = UserDefaults.standard
                print("passed defaults")
                let name = defaults.string(forKey: "status")
                
                let status = name
                if(status!.range(of: "Open 2 hours late") != nil){
                    self.setdelayed()
                    print("set delayed")

                    
                }
                else if(status!.range(of: "Closed") != nil){
                    self.setClosed()
                    print("set closed")
                    
                }else{
                    self.setopen()
                    print("set open")
                                    }
                  print("end")
            }
        }
        
    }
    
    
    func handleRefresh(_ refreshControl: UIRefreshControl) {
        datestring.text = "Last Refreshed: "+DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
        setview()
        
        
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    
    
    
    
    @IBAction func toggleSideMenu(_ sender: AnyObject) {
        toggleSideMenuView()
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        print("sideMenuShouldOpenSideMenu")
        return true
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }
    func randomimage(){
        if(ran)==0{
        backroundimage.image = UIImage(named:"snow2.png")
        }
        if(ran)==1{
            backroundimage.image = UIImage(named:"snow3.png")
        }
        if(ran)==2{
            backroundimage.image = UIImage(named:"snow4.png")
        }
        if(ran)==3{
            backroundimage.image = UIImage(named:"snow5.png")
        }
        
        
    }
    
    override func viewDidLoad() {
        randomimage()
        
        
        
        //rotateView()
        setview()
        

        self.navigationController!.navigationBar.isHidden = true
        self.sideMenuController()?.sideMenu?.delegate = self
        
        datestring.text = "Last Refreshed: "+DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        
        self.tableView.addPullToRefresh({ [weak self] in
            self!.datestring.text = "Last Refreshed: "+DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
            self!.setview()
            
            self?.tableView.reloadData()
            self?.tableView.stopPullToRefresh()
            })
        
        
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    
    
    
    
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
