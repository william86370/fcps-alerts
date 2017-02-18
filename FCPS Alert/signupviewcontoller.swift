//
//  signupviewcontoller.swift
//  FCPS Alert
//
//  Created by Admin on 2/18/17.
//  Copyright © 2017 A.R.C software and enginering. All rights reserved.
//

import UIKit

class signupviewcontoller: UIViewController,UIPickerViewDelegate {
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!

    @IBOutlet weak var pickerview: UIPickerView!
    @IBOutlet weak var statelbl: UILabel!
    
    var pickerstates = ["VA"];
    
    @IBAction func statepicker(_ sender: Any) {
    
    
    
    
    
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
    }
    
    private func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerstates.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerstates[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statelbl.text = pickerstates[row]
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        
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
