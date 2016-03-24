//
//  LoginViewController.swift
//  PoliPicks
//
//  Created by Justin Peng on 3/14/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var sendConfirmationButton: UIButton!
    @IBOutlet weak var phoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sendConfirmationButton.layer.cornerRadius = 5
        sendConfirmationButton.layer.borderWidth = 1.5
        sendConfirmationButton.layer.borderColor = UIColor.whiteColor().CGColor

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapDismiss(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func pressSendConfirmationButton(sender: AnyObject) {
        if phoneNumber.text == "1234567890" {
            self.performSegueWithIdentifier("loginSegue", sender: self)
        } else {
            let alertController = UIAlertController(title: "Invalid Phone Number", message: "Please enter a valid phone number.", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
