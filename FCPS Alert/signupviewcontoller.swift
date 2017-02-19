//
//  signupviewcontoller.swift
//  FCPS Alert
//
//  Created by Admin on 2/18/17.
//  Copyright © 2017 A.R.C software and enginering. All rights reserved.
//

import UIKit

class signupviewcontoller: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!

    @IBOutlet weak var schoollbl: UILabel!
   
    @IBOutlet weak var pickerTextField: UITextField!
    
    @IBOutlet weak var nextbtn: UIButton!
    
    
    
    var ref: FIRDatabaseReference!
    
   
    
    var pickOption = ["va","wv","nc","ny"]
    var pickerschools = [String]()
    var state = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = pickOption[row]
        if(nextbtn.isUserInteractionEnabled == false){
         nextbtn.isUserInteractionEnabled = true
        }
    }
    @IBAction func next(_ sender: Any) {
        print("hi")
        state = pickerTextField.text!
        schoollbl.text = "Next Lets Select Your School or Organation"
        pickerTextField.text = " "
            
        ref.observe(.value, with: { snapshot in
            print(snapshot.value!)
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //assign firebase database
         ref = FIRDatabase.database().reference()
        
        
        let pickerView = UIPickerView()
        
        pickerView.delegate = self
        
        pickerTextField.inputView = pickerView
        
        
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
            }           // ...
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

