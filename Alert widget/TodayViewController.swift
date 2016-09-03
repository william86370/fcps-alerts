//
//  TodayViewController.swift
//  Alert widget
//
//  Created by william wright  on 7/8/16.
//  Copyright © 2016 A.R.C software and enginering. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var status: UIImageView!
    func setopen(){
        status.image = UIImage(named:"open circle.png")
        lbl.text = "FCPS Status: Open"
    }
    func setdelayed(){
        status.image = UIImage(named:"delayovel.png")
         lbl.text = "FCPS Status: 2 HR Delay"
    }
    func setClosed(){
        status.image = UIImage(named:"closedcircle.png")
         lbl.text = "FCPS Status: Closed"
    }
    func update(){
        self.downloadwebsitedats(){(isResponse) -> Void in
            print("ran fetch")
DispatchQueue.main.async {
    
    let defaults = UserDefaults.standard
    let name = defaults.string(forKey: "status")
    let status = name
    print(isResponse)
    if(isResponse.range(of: "Open 2 hours late") != nil){
        self.setdelayed()
        print("set delayed")
        
        
    }
    else if(isResponse.range(of: "Closed") != nil){
        self.setClosed()
        print("set closed")
        
    }else{
        
        self.setopen()
    }
    
    }
            
    }//end of downalod
        
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
    

    override func viewDidLoad() {
        //update()setopen()
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func widgetMarginInsetsForProposedMarginInsets
        (defaultMarginInsets: UIEdgeInsets) -> (UIEdgeInsets) {
        return UIEdgeInsetsZero
    }
    
    func widgetPerformUpdate(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        setopen()
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
