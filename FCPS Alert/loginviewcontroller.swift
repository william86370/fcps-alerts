//
//  loginviewcontroller.swift
//  FCPS Alert
//
//  Created by William Wright on 2/18/17.
//  Copyright © 2017 A.R.C software and enginering. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import Gifu

class loginviewcontroller: UIViewController, GIDSignInUIDelegate {
//get the users usernamme
    @IBOutlet weak var username: UITextField!
    //get the users password
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func login(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
  
    @IBOutlet weak var image2: GIFImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
                image2.animate(withGIFNamed: "snowfinal")
        
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(loginviewcontroller.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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

    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        print("good with google")
        if let error = error {
            // ...
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                          accessToken: authentication.accessToken)
        // ...
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
