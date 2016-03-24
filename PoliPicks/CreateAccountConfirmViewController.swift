//
//  CreateAccountConfirmViewController.swift
//  PoliPicks
//
//  Created by Grace Qi on 3/23/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class CreateAccountConfirmViewController: UIViewController {

    @IBOutlet weak var confirmationTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressDidntGetCode(sender: UIButton) {
        let alertController = UIAlertController(title: "Didn't get code", message: "Code resent. Please check your text message.", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(OKAction)
        self.presentViewController(alertController, animated: true, completion: nil)
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
