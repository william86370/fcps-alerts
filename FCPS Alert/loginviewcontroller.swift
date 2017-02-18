//
//  loginviewcontroller.swift
//  FCPS Alert
//
//  Created by William Wright on 2/18/17.
//  Copyright © 2017 A.R.C software and enginering. All rights reserved.
//

import UIKit


class loginviewcontroller: UIViewController {
//get the users usernamme
    @IBOutlet weak var username: UITextField!
    //get the users password
    @IBOutlet weak var password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //when user clicks login button
    @IBAction func loginbtn(_ sender: Any) {
    FIRAuth.auth()?.signIn(withEmail: username.text!, password: password.text!) { (user, error) in
            //check if user is logged in 
        if FIRAuth.auth()?.currentUser != nil {
            // User is signed in.
            print("user signed in ")
            
           self.performSegue(withIdentifier: "accountgood2", sender: self)
            // ...
        } else {
            //if login falied
            print("rip login failed")
        }
        }
    }

    
    
    
    
    @IBAction func createaccountbtn(_ sender: Any) {
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
