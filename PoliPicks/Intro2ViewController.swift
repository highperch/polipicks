//
//  Intro2ViewController.swift
//  PoliPicks
//
//  Created by Grace Qi on 3/15/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class Intro2ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.backgroundColor = UIColor.clearColor()
        signUpButton.layer.cornerRadius = 5
        signUpButton.layer.borderWidth = 1.5
        signUpButton.layer.borderColor = UIColor.whiteColor().CGColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
