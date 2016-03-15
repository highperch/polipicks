//
//  TourFinalViewController.swift
//  PoliPicks
//
//  Created by Justin Peng on 3/15/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class TourFinalViewController: UIViewController {

    //Initialize NSUserDefaults
    var defaults = NSUserDefaults()
    
    @IBAction func didTapGetStarted(sender: UIButton) {
        //Set NSUserDefaults for did complete tutorial
        defaults.setValue(true, forKey: "didCompleteTutorial")
        defaults.synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
