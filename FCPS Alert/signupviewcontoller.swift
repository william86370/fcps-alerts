//
//  signupviewcontoller.swift
//  FCPS Alert
//
//  Created by Admin on 2/18/17.
//  Copyright © 2017 A.R.C software and enginering. All rights reserved.
//

import UIKit

class signupviewcontoller: UIViewController {
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signupbtn(_ sender: Any) {
        FIRAuth.auth()?.createUser(withEmail: email.text!, password: password.text!) { (user, error) in
            if (error != nil){
                print(error!)
            }
            
            let changeRequest = FIRAuth.auth()?.currentUser?.profileChangeRequest()
            changeRequest?.displayName = self.username.text!
            changeRequest?.commitChanges() { (error) in
              self.performSegue(withIdentifier: "accountgood", sender: self)
            }            // ...
        }
        
    }
    @IBAction func terms(_ sender: Any) {
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
