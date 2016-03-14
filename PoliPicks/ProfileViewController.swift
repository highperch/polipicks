//
//  ProfileViewController.swift
//  PoliPicks
//
//  Created by Justin Peng on 3/13/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    //Outlets for the profile and settings views
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var settingsView: UIView!
    //Outlets for labels
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var bestDayLabel: UILabel!
    @IBOutlet weak var streakLabel: UILabel!
    
    
    //Settings button
    @IBAction func didTapSettings(sender: UIBarButtonItem) {
        //Present settings view
        settingsView.hidden = false
        profileView.hidden = true
    }
    
    //Done button
    @IBAction func didTapDone(sender: UIBarButtonItem) {
        //Present profile view
        profileView.hidden = false
        settingsView.hidden = true
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
