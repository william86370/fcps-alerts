//
//  ViewController.swift
//  FCPS Alert
//
//  Created by william wright  on 12/8/15.
//  Copyright © 2015 A.R.C software and enginering. All rights reserved.
//

import UIKit

import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBAction func sendEmailButtonTapped(_ sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    
    
    @IBAction func menuebtn(_ sender: AnyObject) {
        toggleSideMenuView()
        
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["william86370@gmail.com"])
        mailComposerVC.setSubject("FCPS Alert's Beta 1")
        mailComposerVC.setMessageBody("Hi Will my issue is:", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController!, didFinishWith result: MFMailComposeResult, error: NSError!) {
        controller.dismiss(animated: true, completion: nil)
    }

    
    
    
    
    override func viewDidLoad() {
         self.navigationController!.navigationBar.isHidden = false
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

